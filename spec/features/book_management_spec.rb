require 'rails_helper'

RSpec.feature "Book management", :type => :feature do
    # user = User.create(name: "test_user", password: "testing123")
    # author = Author.create(name: "Anne Rice")
    # book = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id)

    before(:all) do
        Rails.application.load_seed
        @user = User.find_by(name: "test_user1")
        @book = Book.find_by(title: "test_book1")
        visit "/login"
        fill_in "user[name]", :with => @user.name
        fill_in "user[password]", :with => @user.password
        click_button "Login"
    end

    # before(:each) do

    # end

    feature "Book Management" do
        scenario "A user creates a book" do     
            visit "/users/#{@user.id}/books/new"
            fill_in "book[title]", :with => "The Outsider"
            fill_in "book[author]", :with => "Stephen King"
            click_button "Add book"

            expect(page).to have_content("The Outsider")
        end

        scenario "A user views one of their books" do
            visit "/users/#{@user.id}/books/#{@book.id}"
            expect(page).to have_content(@book.title)
        end

        scenario "A user edits one of their books" do
            visit "/books/#{book.id}/edit"

            fill_in "book[pub_year]", :with => "1976"
            click_button "Save"

            expect(page).to have_content("1976")
        end

        scenario "A user deletes one of their books" do
            visit "/books/#{book.id}/edit"
            click_link "Delete Book"
            expect(page).not_to have_content(book.title)
        end
    end
end