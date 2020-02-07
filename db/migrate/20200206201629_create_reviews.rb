class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true 

      t.timestamps
    end
  end
end

# The t.belongs_to :book/:user is a special helper method 
# of rails passing in the association.
# It's an alias - can also be written t.references book/user.

# Acts as an alias for t.integer book_id/user_id, in that it 
# causes an appropriately typed book_id/user_id field to be created.