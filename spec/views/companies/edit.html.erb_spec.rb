require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString",
      :version => "MyString",
      :number_employee => 1,
      :country => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[version]"

      assert_select "input[name=?]", "company[number_employee]"

      assert_select "input[name=?]", "company[country]"
    end
  end
end
