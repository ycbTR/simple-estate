class BaseController < ApplicationController
  before_action :set_current_user

  def set_current_user
    @current_user = current_user
    User.current = @current_user
  end

end