class AddColumnsToTravelSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :travel_spots, :postcode, :string, null: false
    add_column :travel_spots, :prefecture_code, :integer, null: false
    add_column :travel_spots, :address_city, :string, null: false
    add_column :travel_spots, :address_street, :string, null: false
    add_column :travel_spots, :address_building, :string, null: false
    add_column :travel_spots, :introduction, :text, null: false
    add_column :travel_spots, :access, :text, null: false
    add_column :travel_spots, :phone_number, :string, null: false
    add_column :travel_spots, :business_hour, :string, null: false
    add_column :travel_spots, :parking, :text, null: false
    add_column :travel_spots, :home_page, :string
    add_column :travel_spots, :latitude, :float, null: false
    add_column :travel_spots, :longitude, :float, null: false
  end
end
