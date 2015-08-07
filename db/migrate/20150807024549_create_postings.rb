class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :model
      t.string :year
      t.string :length
      t.string :city
      t.string :state
      t.string :status
      t.boolean :flagged
      t.boolean :dealer

      t.timestamps null: false
    end
  end
end
