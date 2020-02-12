class Genre < ApplicationRecord
    # each book must have a genre
    validates :name, presence: true

    has_many :books
end
