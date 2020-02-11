class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    has_secure_password

    has_many :reviews
    has_many :books, through: :reviews

    # google authentication method
    def self.create_by_google(auth)
      #finding by their UID 
      #the UID is the specific ID we receive from the provider
      #we don't know the password 
      #SecureHex.new
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
