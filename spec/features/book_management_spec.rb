require 'rails_helper'

RSpec.feature "Book management", :type => :feature do
    user = User.create(name: "test_user", password: "testing123")
    author = Author.create(name: "Anne Rice")
    book = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id)

    before(:each) do
        visit "/login"
        fill_in "user[name]", :with => user.name
        fill_in "user[password]", :with => user.password
        click_button "Login"
    end

    scenario "A user creates a book" do      
        visit "/books/new"

        fill_in "book[title]", :with => "Interview with the Vampire"
        fill_in "book[author]", :with => "Anne Rice"
        click_button "Add book"

        expect(page).to have_content("Interview with the Vampire")
    end

    scenario "A user views one of their books" do
        visit "/books/#{book.id}"
        expect(page).to have_content(book.title)
    end

    scenario "A user edits one of their books" do
        visit "/books/#{book.id}/edit"

        fill_in "book[pub_year]", :with => "1976"
        click_button "Update"

        expect(page).to have_content("1976")
    end

    scenario "A user deletes one of their books" do
        visit "/books/#{book.id}/delete"
        expect(page).not_to have_content(book.title)
    end
end