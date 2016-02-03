require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        :city => "City",
        :country => "Country",
        :street => "Street",
        :lat => "",
        :long => 1.5,
        :zipcode => "Zipcode",
        :user => nil
      ),
      Property.create!(
        :city => "City",
        :country => "Country",
        :street => "Street",
        :lat => "",
        :long => 1.5,
        :zipcode => "Zipcode",
        :user => nil
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
