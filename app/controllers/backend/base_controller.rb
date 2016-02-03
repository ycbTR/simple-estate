class Backend::BaseController < BaseController
  before_filter :authenticate_user!

end