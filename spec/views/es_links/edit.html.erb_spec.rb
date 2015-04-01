require 'spec_helper'

describe "es_links/edit" do
  before(:each) do
    @es_link = assign(:es_link, stub_model(EsLink,
      :EvidentionID => 1,
      :SymptomID => 1,
      :Description => "MyString"
    ))
  end

  it "renders the edit es_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", es_link_path(@es_link), "post" do
      assert_select "input#es_link_EvidentionID[name=?]", "es_link[EvidentionID]"
      assert_select "input#es_link_SymptomID[name=?]", "es_link[SymptomID]"
      assert_select "input#es_link_Description[name=?]", "es_link[Description]"
    end
  end
end
