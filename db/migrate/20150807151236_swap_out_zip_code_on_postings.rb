class SwapOutZipCodeOnListings < ActiveRecord::Migration
  def change
    add_column :listings, :zip_code, :integer
  end
end
