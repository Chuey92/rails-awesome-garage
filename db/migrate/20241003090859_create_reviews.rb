class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
