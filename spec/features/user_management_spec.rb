require 'rails_helper'

RSpec.feature "User management", :type => :feature do
    user = User.create(name: "test_user", password: "testing123")

    scenario "Visitor creates a new user" do
        visit '/users/new'
		
        fill_in "name", :with => user.name
        fill_in "password", :with => user.password
        click_button "Create User"

        expect(page).to have_content("Welcome to your bookshelf, test_user")
    end

    scenario "User views their info" do
        visit "/users/#{user.id}"
        expect(page).to have_content("Edit your info")
    end

    scenario "User edits their info" do

    end
end