class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.string :query
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
