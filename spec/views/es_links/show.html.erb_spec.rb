require 'spec_helper'

describe "es_links/show" do
  before(:each) do
    @es_link = assign(:es_link, stub_model(EsLink,
      :EvidentionID => 1,
      :SymptomID => 2,
      :Description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
  end
end
