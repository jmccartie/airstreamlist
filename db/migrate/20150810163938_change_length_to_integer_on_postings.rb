class ChangeLengthToIntegerOnPostings < ActiveRecord::Migration
  def up
    change_column :postings, :length, 'integer USING CAST(length AS integer)'
    change_column :postings, :year, 'integer USING CAST(year AS integer)'
  end

  def down
    change_column :postings, :length, :string
    change_column :postings, :year, :string
  end
end
