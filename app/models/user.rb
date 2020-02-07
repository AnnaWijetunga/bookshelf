class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    has_secure_password

    has_many :reviews
    has_many :books, through: :reviews

    # google authentication method
    def self.create_by_google(auth)
        user = self.find_or_create_by(name: auth.info.name, email: auth.info.email)
        if user.save
          user
        else
          user.password = auth.info.email
          user.password_confirmation = auth.info.email
          user.save
          user
        end
    end
end
