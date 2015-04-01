require 'spec_helper'

describe "anamneses/index" do
  before(:each) do
    assign(:anamneses, [
      stub_model(Anamnesis,
        :PersonID => 1,
        :MedicalFacilityID => 2,
        :UserID => 3,
        :Remark => "Remark"
      ),
      stub_model(Anamnesis,
        :PersonID => 1,
        :MedicalFacilityID => 2,
        :UserID => 3,
        :Remark => "Remark"
      )
    ])
  end

  it "renders a list of anamneses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Remark".to_s, :count => 2
  end
end
