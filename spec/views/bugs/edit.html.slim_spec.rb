require 'rails_helper'

RSpec.describe "bugs/edit", type: :view do
  before(:each) do
    @bug = assign(:bug, Bug.create!(
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit bug form" do
    render

    assert_select "form[action=?][method=?]", bug_path(@bug), "post" do

      assert_select "textarea#bug_description[name=?]", "bug[description]"

      assert_select "input#bug_user_id[name=?]", "bug[user_id]"
    end
  end
end
