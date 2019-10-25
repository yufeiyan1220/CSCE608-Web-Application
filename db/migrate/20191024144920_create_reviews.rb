class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :app, foreign_key: true, null: false
      t.integer :star
      t.text :comment

      t.timestamps
    end
  end
end
