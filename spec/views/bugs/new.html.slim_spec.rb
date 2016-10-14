require 'rails_helper'

RSpec.describe "bugs/new", type: :view do
  before(:each) do
    assign(:bug, Bug.new(
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new bug form" do
    render

    assert_select "form[action=?][method=?]", bugs_path, "post" do

      assert_select "textarea#bug_description[name=?]", "bug[description]"

      assert_select "input#bug_user_id[name=?]", "bug[user_id]"
    end
  end
end
