require 'spec_helper'

describe "ed_links/new" do
  before(:each) do
    assign(:ed_link, stub_model(EdLink,
      :EvidentionID => 1,
      :DiagnoseID => 1,
      :Description => "MyString"
    ).as_new_record)
  end

  it "renders new ed_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ed_links_path, "post" do
      assert_select "input#ed_link_EvidentionID[name=?]", "ed_link[EvidentionID]"
      assert_select "input#ed_link_DiagnoseID[name=?]", "ed_link[DiagnoseID]"
      assert_select "input#ed_link_Description[name=?]", "ed_link[Description]"
    end
  end
end
