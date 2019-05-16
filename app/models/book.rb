class Book < ApplicationRecord
  include ApplicationHelper
  belongs_to :user
  belongs_to :author
  validates_presence_of :title, :author
  validates_uniqueness_of :title
end
