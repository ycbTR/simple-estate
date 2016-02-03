class PropertiesController < BaseController
  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.page(params[:page])
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.title property.title
      marker.lat property.lat
      marker.lng property.long
      #marker.picture :url => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png", :width => 36, :height => 36
      marker.infowindow property.title
    end

  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

end
