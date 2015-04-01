require 'spec_helper'

describe "evidentions/new" do
  before(:each) do
    assign(:evidention, stub_model(Evidention,
      :AnamnesisID => 1,
      :PersonID => 1,
      :MedicalStuffID => 1,
      :Remark => "MyString"
    ).as_new_record)
  end

  it "renders new evidention form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", evidentions_path, "post" do
      assert_select "input#evidention_AnamnesisID[name=?]", "evidention[AnamnesisID]"
      assert_select "input#evidention_PersonID[name=?]", "evidention[PersonID]"
      assert_select "input#evidention_MedicalStuffID[name=?]", "evidention[MedicalStuffID]"
      assert_select "input#evidention_Remark[name=?]", "evidention[Remark]"
    end
  end
end
