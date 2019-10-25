class CreatePurchaseItems < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_items do |t|
      t.integer :used_times, default: 0
      t.float :price
      t.references :app, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
