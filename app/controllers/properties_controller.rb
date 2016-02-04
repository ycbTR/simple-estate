class PropertiesController < BaseController
  before_action :set_property, except: [:index]
  before_action :authenticate_user!, only: [:wish, :unwish]

  # GET /properties
  # GET /properties.json
  def index
    params[:q] ||= {}
    @search = Property.search params[:q]
    @properties = @search.result(distinct: :true).page(params[:page])

    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.title property.title
      marker.lat property.lat
      marker.lng property.long
      #marker.picture :url => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png", :width => 36, :height => 36
      marker.infowindow property.title
    end
  end

  def wish
    @property.wish_lists.find_or_create_by(user_id: @current_user.id)
  end

  def unwish
    @property.wish_lists.where(user_id: @current_user.id).destroy_all
    render 'wish'
  end


  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end
