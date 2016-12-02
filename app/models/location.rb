class Location < ActiveRecord::Base
  geocoded_by :name  # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  after_validation :geocode, :if => :name_changed?

end
