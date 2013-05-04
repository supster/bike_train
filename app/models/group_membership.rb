class GroupMembership < ActiveRecord::Base
  attr_accessible :group_id, :is_admin, :user_id
  belongs_to :user
  belongs_to :group
end
