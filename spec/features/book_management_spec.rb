require 'rails_helper'

RSpec.feature "Book management", :type => :feature do
    scenario "A user creates a book" do
        visit "/books/new"

        fill_in "title", :with => "Interview with the Vampire"
        fill_in "author", :with => "Anne Rice"
        click_button "Add book"

        expect(page).to have_content("Interview with the Vampire")
    end
end