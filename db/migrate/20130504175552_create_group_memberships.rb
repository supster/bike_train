class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :is_admin

      t.timestamps
    end
  end
end
