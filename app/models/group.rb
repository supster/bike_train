class Group < ActiveRecord::Base
  attr_accessible :name, :description, :destination_address_id, :origin_address_id
  has_many :groupMemberships
  has_many :users, :through => :groupMemberships 
end
