require 'spec_helper'

describe "tm_links/index" do
  before(:each) do
    assign(:tm_links, [
      stub_model(TmLink,
        :TherapyID => 1,
        :MedicamentID => 2,
        :Quantity => "Quantity",
        :Description => "Description"
      ),
      stub_model(TmLink,
        :TherapyID => 1,
        :MedicamentID => 2,
        :Quantity => "Quantity",
        :Description => "Description"
      )
    ])
  end

  it "renders a list of tm_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
