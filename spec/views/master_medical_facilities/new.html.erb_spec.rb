require 'spec_helper'

describe "master_medical_facilities/new" do
  before(:each) do
    assign(:master_medical_facility, stub_model(MasterMedicalFacility,
      :Code => "MyString",
      :Name => "MyString",
      :Address => "MyString",
      :Telephone => "MyString"
    ).as_new_record)
  end

  it "renders new master_medical_facility form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", master_medical_facilities_path, "post" do
      assert_select "input#master_medical_facility_Code[name=?]", "master_medical_facility[Code]"
      assert_select "input#master_medical_facility_Name[name=?]", "master_medical_facility[Name]"
      assert_select "input#master_medical_facility_Address[name=?]", "master_medical_facility[Address]"
      assert_select "input#master_medical_facility_Telephone[name=?]", "master_medical_facility[Telephone]"
    end
  end
end
