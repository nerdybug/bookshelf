require 'rails_helper'

RSpec.describe Gifter, type: :model do
  it 'has a name' do
    expect(Gifter.new).to respond_to(:name)
  end
end