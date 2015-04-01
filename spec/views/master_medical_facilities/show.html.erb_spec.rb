require 'spec_helper'

describe "master_medical_facilities/show" do
  before(:each) do
    @master_medical_facility = assign(:master_medical_facility, stub_model(MasterMedicalFacility,
      :Code => "Code",
      :Name => "Name",
      :Address => "Address",
      :Telephone => "Telephone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/Telephone/)
  end
end
