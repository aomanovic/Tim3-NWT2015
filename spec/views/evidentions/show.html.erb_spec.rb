require 'spec_helper'

describe "evidentions/show" do
  before(:each) do
    @evidention = assign(:evidention, stub_model(Evidention,
      :AnamnesisID => 1,
      :PersonID => 2,
      :MedicalStuffID => 3,
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
