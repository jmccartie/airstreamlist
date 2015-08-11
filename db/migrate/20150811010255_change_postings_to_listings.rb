class ChangePostingsToListings < ActiveRecord::Migration
  def change
    rename_table :postings, :listings
  end
end
