class AddDescriptionToListings < ActiveRecord::Migration
  def change
    add_column :listings, :description, :text

    change_column :listings, :flagged, :boolean, default: false, null: false
    change_column :listings, :dealer, :boolean, null: false
  end
end
