class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true 
    # I want email to be present as well as unique - how to write

    has_secure_password

    has_many :reviews
    has_many :books, through: :reviews

    # eventually will need google authentication model here

end
