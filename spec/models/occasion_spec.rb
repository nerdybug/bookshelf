require 'rails_helper'

RSpec.describe Occasion, type: :model do
  it 'has a name' do
    expect(Occasion.new).to respond_to(:name)
  end

  it 'has a year' do
    expect(Occasion.new).to respond_to(:year)
  end

  it 'has many books' do
    user = User.create(name: "User One", password: "12345")
    author = Author.create(name: "Anne Rice")
    occasion = Occasion.create(name: "christmas", year: 2000)
    gifter = Gifter.create(name: "santa")
    book_one = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    book_two = Book.create(user_id: user.id, title: "Queen of the Damned", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter.id)
    expect(occasion.books.count).to eq(2)
  end

  it 'has many gifters' do
    user = User.create(name: "User One", password: "12345")
    author = Author.create(name: "Anne Rice")
    occasion = Occasion.create(name: "birthday", year: 2002)
    gifter_one = Gifter.create(name: "mom")
    gifter_two = Gifter.create(name: "dad")
    book_one = Book.create(user_id: user.id, title: "Interview with the Vampire", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter_one.id)
    book_two = Book.create(user_id: user.id, title: "Queen of the Damned", author_id: author.id, occasion_id: occasion.id, gifter_id: gifter_two.id)
    expect(occasion.gifters).to include(gifter_one, gifter_two)
  end
end