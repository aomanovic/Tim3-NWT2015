require 'spec_helper'

describe "dt_links/new" do
  before(:each) do
    assign(:dt_link, stub_model(DtLink,
      :DiagnoseID => 1,
      :TherapyID => 1,
      :Description => "MyString"
    ).as_new_record)
  end

  it "renders new dt_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dt_links_path, "post" do
      assert_select "input#dt_link_DiagnoseID[name=?]", "dt_link[DiagnoseID]"
      assert_select "input#dt_link_TherapyID[name=?]", "dt_link[TherapyID]"
      assert_select "input#dt_link_Description[name=?]", "dt_link[Description]"
    end
  end
end
