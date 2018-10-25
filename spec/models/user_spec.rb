require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a name' do
    expect(User.new).to respond_to(:name)
  end

  it 'has a password' do
    expect(User.new).to respond_to(:password)
  end

  it 'has many books' do
    user = User.create(name: "testing", password: "testing!")
    author = Author.create(name: "test author")
    book_one = Book.create(user_id: user.id, title: "one", author_id: author.id)
    book_two = Book.create(user_id: user.id, title: "two", author_id: author.id)
    expect(user.books.length).to eq(2)
  end

  describe 'authenticated with secure password' do
    it 'returns a User if the password is correct' do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('foo')).to eq(user)
    end

    it 'returns false if password is not correct' do
      user = User.new
      user.password = 'foo'
      expect(user.authenticate('fo0')).to be_falsey
    end
  end
end