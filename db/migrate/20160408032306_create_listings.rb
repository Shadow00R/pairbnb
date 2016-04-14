class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :home_type
      t.string :room_type
      t.integer :accomodates
      t.string :address
      t.string :city
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
