class ChangeDealerOnListings < ActiveRecord::Migration
  def up
    remove_column :listings, :dealer
    add_column :listings, :kind, :string
  end

  def down
    remove_column :listings, :kind
    add_column :listings, :dealer, :boolean

  end
end
