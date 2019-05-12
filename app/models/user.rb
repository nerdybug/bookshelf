class User < ApplicationRecord
    has_secure_password validations: false
    has_many :books
    has_many :authors, through: :books
    validates_presence_of :name
    validates_presence_of :password, :if => :should_have_password?

    def self.find_or_create_with_omniauth(auth)
        auth_name = auth["extra"]["raw_info"]["login"]
        user = User.find_by(name: auth_name)

        if user == nil
            user = create(name: auth_name, provider: auth["provider"])
        end

        user
    end

    def should_have_password?
        provider.to_s.strip.empty?
    end
    
end
