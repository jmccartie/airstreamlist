class SwapOutZipCodeOnPostings < ActiveRecord::Migration
  def change
    add_column :postings, :zip_code, :integer
  end
end
