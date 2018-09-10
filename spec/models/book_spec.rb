require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a title' do
    expect(Book.new).to respond_to(:title)
  end

  it 'has a user' do
    expect(Book.new).to respond_to(:user_id)
  end

  it 'has an author' do
    expect(Book.new).to respond_to(:author_id)
  end

  it 'has a genre' do
    expect(Book.new).to respond_to(:genre_id)
  end

  it 'has an occasion' do
    expect(Book.new).to respond_to(:occasion_id)
  end

  it 'has a gifter' do
    expect(Book.new).to respond_to(:gifter_id)
  end

  it 'has a publication year' do
    expect(Book.new).to respond_to(:pub_year)
  end

  it 'has a note' do
    expect(Book.new).to respond_to(:note)
  end

  it 'can be a favorite' do
    expect(Book.new).to respond_to(:favorite)
  end
end