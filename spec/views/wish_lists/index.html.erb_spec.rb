require 'rails_helper'

RSpec.describe "wish_lists/index", type: :view do
  before(:each) do
    assign(:wish_lists, [
      WishList.create!(
        :user => nil,
        :property => nil
      ),
      WishList.create!(
        :user => nil,
        :property => nil
      )
    ])
  end

  it "renders a list of wish_lists" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
