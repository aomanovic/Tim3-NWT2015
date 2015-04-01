require 'spec_helper'

describe "ed_links/show" do
  before(:each) do
    @ed_link = assign(:ed_link, stub_model(EdLink,
      :EvidentionID => 1,
      :DiagnoseID => 2,
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
