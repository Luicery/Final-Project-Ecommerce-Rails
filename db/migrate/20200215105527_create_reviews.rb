class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
