require 'rails_helper'

RSpec.describe Gifter, type: :model do
  it 'has a name' do
    expect(Gifter.new).to respond_to(:name)
  end

  it 'has many books' do
    user = User.create(name: "User One", password: "12345")
    author = Author.create(name: "Anne Rice")
    occasion = Occasion.create(name: "christmas", year: 2000)
    gifter = Gifter.create(name: "santa")
    book_one = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    book_two = Book.create(user_id: user.id, title: "Queen of the Damned", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    expect(gifter.books.count).to eq(2)
  end

  it 'has many occasions' do
    user = User.create(name: "User One", password: "12345")
    author = Author.create(name: "Anne Rice")
    occasion_one = Occasion.create(name: "christmas", year: 2002)
    occasion_two = Occasion.create(name: "birthday", year: 2002)
    gifter = Gifter.create(name: "mom")
    book_one = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id, occasion_id: occasion_one.id, gifter_id: gifter.id)
    book_two = Book.create(user_id: user.id, title: "Queen of the Damned", author_id: author.id, occasion_id: occasion_two.id, gifter_id: gifter.id)
    expect(gifter.occasions).to include(occasion_one, occasion_two)
  end
end