class ChangeLengthToIntegerOnListings < ActiveRecord::Migration
  def up
    change_column :listings, :length, 'integer USING CAST(length AS integer)'
    change_column :listings, :year, 'integer USING CAST(year AS integer)'
  end

  def down
    change_column :listings, :length, :string
    change_column :listings, :year, :string
  end
end
