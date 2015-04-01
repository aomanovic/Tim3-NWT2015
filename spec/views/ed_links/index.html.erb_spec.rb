require 'spec_helper'

describe "ed_links/index" do
  before(:each) do
    assign(:ed_links, [
      stub_model(EdLink,
        :EvidentionID => 1,
        :DiagnoseID => 2,
        :Description => "Description"
      ),
      stub_model(EdLink,
        :EvidentionID => 1,
        :DiagnoseID => 2,
        :Description => "Description"
      )
    ])
  end

  it "renders a list of ed_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
