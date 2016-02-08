class Api::V1::PropertiesController < Api::V1::BaseController
  before_action :set_property, except: [:index]

  acts_as_token_authentication_handler_for User , only: [:wish, :unwish]
  before_action :authenticate_user!, only: [:wish, :unwish]

  # GET /properties
  # GET /properties.json
  def index
    params[:q] ||= {}
    @search = Property.search params[:q]
    @properties = @search.result(distinct: :true).page(params[:page])

    render(:json => {:response => {:success => true,
                                   :info => "Properties",
                                   data: {properties: @properties }, :status => 200}}) and return

  end

  def wish
    @property.wish_lists.find_or_create_by(user_id: current_user.id)

    render(:json => {:response => {:success => true,
                                   :info => "Successfully Added to your Wish List",
                                   data: {property_id: params[:id] },:status => 200}})


  end

  def unwish
    @property.wish_lists.where(user_id: current_user.id).destroy_all
    render(:json => {:response => {:success => true,
                                   :info => "Successfully Removed from your Wish List",
                                   data: {property_id: params[:id] }, :status => 200}})
  end


  # GET /properties/1
  # GET /properties/1.json
  def show
    render(:json => {:response => {:success => true,
                                   :info => "Property",
                                   data: {property: @property }, :status => 200}})
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end
