class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates_presence_of :title, :author
end
