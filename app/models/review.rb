class Review < ApplicationRecord
    validates :content, presence: true, length: {minimum: 5}
    belongs_to :book
    belongs_to :user
end
