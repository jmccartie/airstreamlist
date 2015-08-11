class RemoveZipCodeFromListings < ActiveRecord::Migration
  def up
    remove_column :listings, :zip_code
  end

  def down
    add_column :listings, :zip_code, :integer
  end
end
