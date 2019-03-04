class Author < ApplicationRecord
  has_many :books
  has_many :users, through: :books
  validates_presence_of :name
  validates_uniqueness_of :name
end
