class ChangeDealerOnPostings < ActiveRecord::Migration
  def up
    remove_column :postings, :dealer
    add_column :postings, :kind, :string
  end

  def down
    remove_column :postings, :kind
    add_column :postings, :dealer, :boolean

  end
end
