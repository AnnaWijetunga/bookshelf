class Book < ApplicationRecord
    # author's first name has to be present
    validates :author_first, presence: true

    # book title has to be present and has to be unique
    validates :title, presence: true, uniqueness: { case_sensitive: false }

    belongs_to :genre
    has_many :reviews
    has_many :users, through: :reviews

    # allows nested form for reviews
    accepts_nested_attributes_for :reviews

    # SQL statements to order books by title and author
    # StaticController contains the methods
    scope :order_by_title, -> {order("title")}
    scope :order_by_author, -> {order("author_last")}

end