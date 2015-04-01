require 'spec_helper'

describe "tm_links/edit" do
  before(:each) do
    @tm_link = assign(:tm_link, stub_model(TmLink,
      :TherapyID => 1,
      :MedicamentID => 1,
      :Quantity => "MyString",
      :Description => "MyString"
    ))
  end

  it "renders the edit tm_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tm_link_path(@tm_link), "post" do
      assert_select "input#tm_link_TherapyID[name=?]", "tm_link[TherapyID]"
      assert_select "input#tm_link_MedicamentID[name=?]", "tm_link[MedicamentID]"
      assert_select "input#tm_link_Quantity[name=?]", "tm_link[Quantity]"
      assert_select "input#tm_link_Description[name=?]", "tm_link[Description]"
    end
  end
end
