class Trip < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :name, :state_abbr, :street_address, :zip_code
end
