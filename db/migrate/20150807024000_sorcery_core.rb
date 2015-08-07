class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :name
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end