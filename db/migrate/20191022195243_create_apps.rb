class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :app_type
      t.string :version
      t.references :company, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
