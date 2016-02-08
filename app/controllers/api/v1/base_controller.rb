class Api::V1::BaseController < ApplicationController
  skip_before_filter :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ArgumentError, :with => :missing_parameter


  def missing_parameter
    render(:json => {:response => {:success => false,
                                   :info => "Missing Parameter",
                                   :status => 400}}) and return

  end

  def not_found
    render(:json => {:response => {:success => false,
                                   :info => "Not Found",
                                  :status => 404}}) and return

  end

end