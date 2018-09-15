class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_many :authors, through: :books
end
