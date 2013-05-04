class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :origin_address_id
      t.integer :destination_address_id

      t.timestamps
    end
  end
end
