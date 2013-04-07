class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state_abbr
      t.string :zip_code
      t.string :country
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
