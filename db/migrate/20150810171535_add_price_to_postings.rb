class AddPriceToListings < ActiveRecord::Migration
  def change
    add_column :listings, :price, :integer, null: false
  end
end
