require 'rails_helper'

RSpec.describe Occasion, type: :model do
  it 'has a name' do
    expect(Occasion.new).to respond_to(:name)
  end

  it 'has a year' do
    expect(Occasion.new).to respond_to(:year)
  end
end