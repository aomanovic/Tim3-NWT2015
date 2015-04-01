require 'spec_helper'

describe "anamneses/edit" do
  before(:each) do
    @anamnesis = assign(:anamnesis, stub_model(Anamnesis,
      :PersonID => 1,
      :MedicalFacilityID => 1,
      :UserID => 1,
      :Remark => "MyString"
    ))
  end

  it "renders the edit anamnesis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", anamnesis_path(@anamnesis), "post" do
      assert_select "input#anamnesis_PersonID[name=?]", "anamnesis[PersonID]"
      assert_select "input#anamnesis_MedicalFacilityID[name=?]", "anamnesis[MedicalFacilityID]"
      assert_select "input#anamnesis_UserID[name=?]", "anamnesis[UserID]"
      assert_select "input#anamnesis_Remark[name=?]", "anamnesis[Remark]"
    end
  end
end
