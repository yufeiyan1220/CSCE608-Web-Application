require 'rails_helper'

RSpec.describe "apps/index", type: :view do
  before(:each) do
    assign(:apps, [
      App.create!(
        :name => "Name",
        :type => "Type",
        :version => "Version"
      ),
      App.create!(
        :name => "Name",
        :type => "Type",
        :version => "Version"
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
  end
end
