require 'spec_helper'

describe "tm_links/new" do
  before(:each) do
    assign(:tm_link, stub_model(TmLink,
      :TherapyID => 1,
      :MedicamentID => 1,
      :Quantity => "MyString",
      :Description => "MyString"
    ).as_new_record)
  end

  it "renders new tm_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tm_links_path, "post" do
      assert_select "input#tm_link_TherapyID[name=?]", "tm_link[TherapyID]"
      assert_select "input#tm_link_MedicamentID[name=?]", "tm_link[MedicamentID]"
      assert_select "input#tm_link_Quantity[name=?]", "tm_link[Quantity]"
      assert_select "input#tm_link_Description[name=?]", "tm_link[Description]"
    end
  end
end
