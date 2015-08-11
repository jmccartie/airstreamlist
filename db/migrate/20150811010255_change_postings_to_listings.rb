class ChangeListingsToListings < ActiveRecord::Migration
  def change
    rename_table :listings, :listings
  end
end
