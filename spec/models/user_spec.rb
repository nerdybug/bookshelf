require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a name' do
    expect(User.new).to respond_to(:name)
  end

  it 'has a password' do
    expect(User.new).to respond_to(:password)
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