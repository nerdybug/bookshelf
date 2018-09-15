class Occasion < ApplicationRecord
  has_many :books
  has_many :gifters, through: :books
end
