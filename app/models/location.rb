class Location < ApplicationRecord
  belongs_to :trip
  has_on :address
end
