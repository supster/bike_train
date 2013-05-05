class Group < ActiveRecord::Base
  attr_accessible :name, :description, :destination_address_id, :origin_address_id
  has_many :groupMemberships
  has_many :users, :through => :groupMemberships 

  attr_accessible :groupMemberships_attributes
  
  accepts_nested_attributes_for :groupMemberships
end
