require 'rails_helper'

RSpec.describe "bugs/index", type: :view do
  before(:each) do
    assign(:bugs, [
      Bug.create!(
        :description => "MyText",
        :user => nil
      ),
      Bug.create!(
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of bugs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
