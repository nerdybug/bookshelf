require 'rails_helper'

RSpec.feature "User management", :type => :feature do
    scenario "Visitor creates a new user" do
        visit '/users/new'
		
        fill_in "name", :with => "test_user"
        fill_in "password", :with => "testing123"
        click_button "Create User"

        expect(page).to have_content("Welcome to your bookshelf, test_user")
    end
end