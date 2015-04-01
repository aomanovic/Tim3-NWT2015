require 'spec_helper'

describe "es_links/new" do
  before(:each) do
    assign(:es_link, stub_model(EsLink,
      :EvidentionID => 1,
      :SymptomID => 1,
      :Description => "MyString"
    ).as_new_record)
  end

  it "renders new es_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", es_links_path, "post" do
      assert_select "input#es_link_EvidentionID[name=?]", "es_link[EvidentionID]"
      assert_select "input#es_link_SymptomID[name=?]", "es_link[SymptomID]"
      assert_select "input#es_link_Description[name=?]", "es_link[Description]"
    end
  end
end
