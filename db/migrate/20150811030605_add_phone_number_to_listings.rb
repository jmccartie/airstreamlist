class AddPhoneNumberToListings < ActiveRecord::Migration
  def change
    add_column :listings, :phone, :string
  end
end
