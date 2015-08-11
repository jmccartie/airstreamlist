class AddUserIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :user_id, :integer, null: false
  end
end
