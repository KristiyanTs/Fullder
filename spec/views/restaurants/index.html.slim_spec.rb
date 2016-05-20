require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :description => "MyText",
        :woring_time => "Woring Time",
        :tlephone_number => "Tlephone Number",
        :rating => "9.99"
      ),
      Restaurant.create!(
        :name => "Name",
        :address => "Address",
        :description => "MyText",
        :woring_time => "Woring Time",
        :tlephone_number => "Tlephone Number",
        :rating => "9.99"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Woring Time".to_s, :count => 2
    assert_select "tr>td", :text => "Tlephone Number".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
