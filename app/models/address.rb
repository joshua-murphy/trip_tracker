class Address < ApplicationRecord
  belongs_to :location

  validates_presence_of :street_address, :city, :state, :zip  
end
