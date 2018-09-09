require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a name' do
    expect(User.new).to respond_to(:name)
  end

  it 'has a password' do
    expect(User.new).to respond_to(:password)
  end
end