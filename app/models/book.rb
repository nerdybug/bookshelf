class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :occasion
  belongs_to :gifter
end
