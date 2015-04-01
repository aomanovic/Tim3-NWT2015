require 'spec_helper'

describe "anamneses/show" do
  before(:each) do
    @anamnesis = assign(:anamnesis, stub_model(Anamnesis,
      :PersonID => 1,
      :MedicalFacilityID => 2,
      :UserID => 3,
      :Remark => "Remark"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Remark/)
  end
end
