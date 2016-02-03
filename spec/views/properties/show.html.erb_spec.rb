require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :city => "City",
      :country => "Country",
      :street => "Street",
      :lat => "",
      :long => 1.5,
      :zipcode => "Zipcode",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(//)
  end
end
