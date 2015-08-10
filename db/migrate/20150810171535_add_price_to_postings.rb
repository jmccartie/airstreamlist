class AddPriceToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :price, :integer, null: false
  end
end
