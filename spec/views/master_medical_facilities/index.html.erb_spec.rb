require 'spec_helper'

describe "master_medical_facilities/index" do
  before(:each) do
    assign(:master_medical_facilities, [
      stub_model(MasterMedicalFacility,
        :Code => "Code",
        :Name => "Name",
        :Address => "Address",
        :Telephone => "Telephone"
      ),
      stub_model(MasterMedicalFacility,
        :Code => "Code",
        :Name => "Name",
        :Address => "Address",
        :Telephone => "Telephone"
      )
    ])
  end

  it "renders a list of master_medical_facilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
  end
end
