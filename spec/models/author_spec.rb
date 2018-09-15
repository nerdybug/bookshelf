require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'has a name' do
    expect(User.new).to respond_to(:name)
  end

  it 'has many books' do
    user_one = User.create(name: "User One", password: "12345")
    user_two = User.create(name: "User Two", password: "54321")
    author = Author.create(name: "Anne Rice")
    occasion = Occasion.create(name: "easter", year: 1999)
    gifter = Gifter.create(name: "easter bunny")
    book_one = Book.create(user_id: user_one.id, title: "Interview with the Vampire", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    book_two = Book.create(user_id: user_two.id, title: "Queen of the Damned", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    expect(author.books.length).to eq(2)
  end
end