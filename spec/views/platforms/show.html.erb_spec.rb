require 'rails_helper'

RSpec.describe "platforms/show", type: :view do
  before(:each) do
    @platform = assign(:platform, Platform.create!(
      :name => "Name",
      :version => "Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Version/)
  end
end
