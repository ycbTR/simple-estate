require 'rails_helper'

RSpec.describe "wish_lists/new", type: :view do
  before(:each) do
    assign(:wish_list, WishList.new(
      :user => nil,
      :property => nil
    ))
  end

  it "renders new wish_list form" do
    render

    assert_select "form[action=?][method=?]", wish_lists_path, "post" do

      assert_select "input#wish_list_user_id[name=?]", "wish_list[user_id]"

      assert_select "input#wish_list_property_id[name=?]", "wish_list[property_id]"
    end
  end
end
