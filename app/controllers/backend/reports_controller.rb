module Backend
  class ReportsController < Backend::BaseController
    before_filter :only_admin

    def index
      @agent_count = User.agent.count
      @customer_count = User.customer.count
      @property_count_for_rent = Property.for_rent.count
      @property_count_for_sale = Property.for_sale.count
    end

  end
end