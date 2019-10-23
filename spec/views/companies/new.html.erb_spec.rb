require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :version => "MyString",
      :number_employee => 1,
      :country => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[version]"

      assert_select "input[name=?]", "company[number_employee]"

      assert_select "input[name=?]", "company[country]"
    end
  end
end
