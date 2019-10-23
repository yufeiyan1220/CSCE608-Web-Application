require 'rails_helper'

RSpec.describe "apps/edit", type: :view do
  before(:each) do
    @app = assign(:app, App.create!(
      :name => "MyString",
      :type => "",
      :version => "MyString"
    ))
  end

  it "renders the edit app form" do
    render

    assert_select "form[action=?][method=?]", app_path(@app), "post" do

      assert_select "input[name=?]", "app[name]"

      assert_select "input[name=?]", "app[type]"

      assert_select "input[name=?]", "app[version]"
    end
  end
end
