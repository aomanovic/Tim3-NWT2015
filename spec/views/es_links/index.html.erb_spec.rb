require 'spec_helper'

describe "es_links/index" do
  before(:each) do
    assign(:es_links, [
      stub_model(EsLink,
        :EvidentionID => 1,
        :SymptomID => 2,
        :Description => "Description"
      ),
      stub_model(EsLink,
        :EvidentionID => 1,
        :SymptomID => 2,
        :Description => "Description"
      )
    ])
  end

  it "renders a list of es_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end