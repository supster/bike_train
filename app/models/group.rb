class Group < ActiveRecord::Base
  attr_accessible :name, :description, :origin_address_id, :destination_address_id
  has_many :groupMemberships
  has_many :users, :through => :groupMemberships
end
