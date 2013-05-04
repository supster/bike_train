class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
