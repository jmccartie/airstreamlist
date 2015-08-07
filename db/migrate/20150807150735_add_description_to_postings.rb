class AddDescriptionToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :description, :text

    change_column :postings, :flagged, :boolean, default: false, null: false
    change_column :postings, :dealer, :boolean, null: false
  end
end
