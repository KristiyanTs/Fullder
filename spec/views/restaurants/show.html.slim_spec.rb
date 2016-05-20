require 'rails_helper'

RSpec.describe "restaurants/show", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "Name",
      :address => "Address",
      :description => "MyText",
      :woring_time => "Woring Time",
      :tlephone_number => "Tlephone Number",
      :rating => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Woring Time/)
    expect(rendered).to match(/Tlephone Number/)
    expect(rendered).to match(/9.99/)
  end
end
