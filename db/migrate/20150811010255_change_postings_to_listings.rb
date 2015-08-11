class ChangePostingsToListings < ActiveRecord::Migration
  def change
    rename_table :listings, :listings
  end
end
