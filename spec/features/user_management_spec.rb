require 'rails_helper'

RSpec.feature "User management", :type => :feature do
    user = User.create(name: "test_user2", password: "testing234")

    scenario "Visitor sees the welcome page" do
        visit root_url
        expect(page).to have_content("Welcome to the Bookshelf")
    end

    scenario "Logging in creates a session" do
    end

    scenario "Visitor creates a new user" do
        visit '/signup'
		
        fill_in "user[name]", :with => "test_user1"
        fill_in "user[password]", :with => "testing123"
        click_button "Signup"

        expect(page).to have_content("Bookshelf of test_user1")
    end

    scenario "Visitor sees their home page after logging in" do
    end

    scenario "User views their info" do
        visit "/users/#{user.id}"
        expect(page).to have_content("Edit your info")
    end

    scenario "User edits their info" do
        visit "users/#{user.id}/edit"
        fill_in "name", :with => "best_user"
        click_button "Update"

        expect(page).to have_content("best_user")
    end

    scenario "User deletes their account" do
        visit "users/#{user.id}/delete"
        expect(page).to have_content("Welcome to bookshelf!")
    end
end