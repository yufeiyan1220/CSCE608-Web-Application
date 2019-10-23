require 'rails_helper'

RSpec.describe "platforms/edit", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :name => "MyString",
      :version => "MyString"
    ))
  end

  it "renders the edit platform form" do
    render

    assert_select "form[action=?][method=?]", platform_path(@platform), "post" do

      assert_select "input[name=?]", "platform[name]"

      assert_select "input[name=?]", "platform[version]"
    end
  end
end
