require 'rails_helper'

RSpec.describe "restaurants/edit", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "MyString",
      :address => "MyString",
      :description => "MyText",
      :woring_time => "MyString",
      :tlephone_number => "MyString",
      :rating => "9.99"
    ))
  end

  it "renders the edit restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurant_path(@restaurant), "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_address[name=?]", "restaurant[address]"

      assert_select "textarea#restaurant_description[name=?]", "restaurant[description]"

      assert_select "input#restaurant_woring_time[name=?]", "restaurant[woring_time]"

      assert_select "input#restaurant_tlephone_number[name=?]", "restaurant[tlephone_number]"

      assert_select "input#restaurant_rating[name=?]", "restaurant[rating]"
    end
  end
end
