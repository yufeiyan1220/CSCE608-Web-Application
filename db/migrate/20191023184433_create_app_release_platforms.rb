class CreateAppReleasePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :app_release_platforms do |t|
      t.references :app, foreign_key: true, null: false
      t.references :platform, foreign_key: true, null: false
      t.timestamps
    end
  end
end
