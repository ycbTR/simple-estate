require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :city => "MyString",
      :country => "MyString",
      :street => "MyString",
      :lat => "",
      :long => 1.5,
      :zipcode => "MyString",
      :user => nil
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "input#property_city[name=?]", "property[city]"

      assert_select "input#property_country[name=?]", "property[country]"

      assert_select "input#property_street[name=?]", "property[street]"

      assert_select "input#property_lat[name=?]", "property[lat]"

      assert_select "input#property_long[name=?]", "property[long]"

      assert_select "input#property_zipcode[name=?]", "property[zipcode]"

      assert_select "input#property_user_id[name=?]", "property[user_id]"
    end
  end
end
