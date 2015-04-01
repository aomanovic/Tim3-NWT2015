require 'spec_helper'

describe "evidentions/index" do
  before(:each) do
    assign(:evidentions, [
      stub_model(Evidention,
        :AnamnesisID => 1,
        :PersonID => 2,
        :MedicalStuffID => 3,
        :Remark => "Remark"
      ),
      stub_model(Evidention,
        :AnamnesisID => 1,
        :PersonID => 2,
        :MedicalStuffID => 3,
        :Remark => "Remark"
      )
    ])
  end

  it "renders a list of evidentions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Remark".to_s, :count => 2
  end
end
