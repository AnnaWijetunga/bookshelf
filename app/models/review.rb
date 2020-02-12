class Review < ApplicationRecord
    # each review must have content (a review), minimum of 5 words
    validates :content, presence: true, length: {minimum: 5}
    
    belongs_to :book
    belongs_to :user
end
