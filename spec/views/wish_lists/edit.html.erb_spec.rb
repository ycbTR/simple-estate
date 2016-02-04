require 'rails_helper'

RSpec.describe "wish_lists/edit", type: :view do
  before(:each) do
    @wish_list = assign(:wish_list, WishList.create!(
      :user => nil,
      :property => nil
    ))
  end

  it "renders the edit wish_list form" do
    render

    assert_select "form[action=?][method=?]", wish_list_path(@wish_list), "post" do

      assert_select "input#wish_list_user_id[name=?]", "wish_list[user_id]"

      assert_select "input#wish_list_property_id[name=?]", "wish_list[property_id]"
    end
  end
end
