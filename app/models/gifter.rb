class Gifter < ApplicationRecord
  has_many :books
  has_many :occasions, through: :books
end
