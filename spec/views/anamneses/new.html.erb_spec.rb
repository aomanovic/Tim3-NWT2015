require 'spec_helper'

describe "anamneses/new" do
  before(:each) do
    assign(:anamnesis, stub_model(Anamnesis,
      :PersonID => 1,
      :MedicalFacilityID => 1,
      :UserID => 1,
      :Remark => "MyString"
    ).as_new_record)
  end

  it "renders new anamnesis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", anamneses_path, "post" do
      assert_select "input#anamnesis_PersonID[name=?]", "anamnesis[PersonID]"
      assert_select "input#anamnesis_MedicalFacilityID[name=?]", "anamnesis[MedicalFacilityID]"
      assert_select "input#anamnesis_UserID[name=?]", "anamnesis[UserID]"
      assert_select "input#anamnesis_Remark[name=?]", "anamnesis[Remark]"
    end
  end
end
