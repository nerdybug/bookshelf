require 'rails_helper'
require 'securerandom'

RSpec.feature "User management", :type => :feature do

    before(:all) do
        Rails.application.load_seed

        @user = User.find_by(name: "test_user1")
        expect(@user).to have_attributes(:name => "test_user1")

        @book = Book.find_by(title: "test_book1")
        expect(@book).to have_attributes(:title => "test_book1")
    end

    scenario "Visitor sees the welcome page" do
        visit root_url
        expect(page).to have_content("Welcome to the Bookshelf")
    end

    scenario "Logging in creates a session" do
    end

    scenario "Visitor creates a new user" do
        visit '/signup'
        
        random_username = SecureRandom.uuid
        random_userpass = SecureRandom.uuid
        
        fill_in "user[name]", :with => random_username
        fill_in "user[password]", :with => random_userpass
        click_button "Create User"
        
        expect(page).to have_content("Bookshelf of #{random_username}")
    end

    scenario "Visitor sees their home page after logging in" do
    end

    scenario "User views their info" do
        page.set_rack_session(user_id: @user.id)
        visit "/users/#{@user.id}"
        expect(page).to have_content("Account Info for #{@user.name}")
    end

    scenario "User edits their info" do
        page.set_rack_session(user_id: @user.id)
        visit "users/#{@user.id}/edit"
        fill_in "user[name]", :with => "best_user"
        click_button "Update"

        expect(page).to have_content("best_user")
    end

    scenario "User deletes their account" do
        page.set_rack_session(user_id: @user.id)
        visit "users/#{@user.id}/edit"
        
        click_link "Delete Account"
        expect(page).to have_content("Welcome to the Bookshelf")
    end
end