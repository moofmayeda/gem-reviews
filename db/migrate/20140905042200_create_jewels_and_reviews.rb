class CreateJewelsAndReviews < ActiveRecord::Migration
  def change
    create_table :jewels do |t|
      t.string :name
      t.string :url
      t.timestamps
    end

    create_table :reviews do |t|
      t.belongs_to :jewel
      t.belongs_to :user
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
