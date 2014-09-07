class CreateUpvotesAndDownvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :review
      t.belongs_to :user
    end
    create_table :downvotes do |t|
      t.belongs_to :review
      t.belongs_to :user
    end
  end
end
