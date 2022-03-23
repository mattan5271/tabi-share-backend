class CreateTravelSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_spots do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.json :images
      t.timestamps
    end
  end
end
