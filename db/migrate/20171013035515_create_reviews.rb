class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :description
      t.integer :rating
      t.string :created_at
      t.string :datetime
      t.string :updated_at
      t.string :datetime

      t.timestamps null: false
    end
  end
end
