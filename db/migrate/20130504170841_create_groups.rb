class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :origin_address_id
      t.address_id :destination

      t.timestamps
    end
  end
end
