class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :name
    	t.string :location
    	t.string :contact
    	t.string :dis_pic
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
