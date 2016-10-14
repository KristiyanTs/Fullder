require 'rails_helper'

RSpec.describe "bugs/show", type: :view do
  before(:each) do
    @bug = assign(:bug, Bug.create!(
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
