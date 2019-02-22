class Author < ApplicationRecord
  has_many :books
  has_many :users, through: :books
  validates _presence_of :name
end
