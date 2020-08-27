class CreateRouteLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :route_locations do |t|
			t.integer :user_id, index: true
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
