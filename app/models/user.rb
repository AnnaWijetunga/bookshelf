class User < ApplicationRecord
  # user must have a name
    validates :name, presence: true

    # user must have an email, and it must be unique
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    # adds two fields to this model:
    # password and password_confirmation
    # corresponds to password_digest column in migration

    has_secure_password

    has_many :reviews
    has_many :books, through: :reviews

    # #google authentication method
    def self.create_by_google(auth)
        user = self.find_or_create_by(name: auth.info.name, email: auth.info.email)
        if user.id
          user
        else
          user.password = auth.info.email
          user.password_confirmation = auth.info.email
          user.save
          user
        end
    end
end