class MapController < ApplicationController
  def index
    @map_api_key = MAP_API_KEY
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.name
      marker.json({ title: location.name })
    end
  end
end
