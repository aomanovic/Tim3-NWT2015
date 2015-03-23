require 'spec_helper'

describe "diagnoses/show" do
  before(:each) do
    @diagnose = assign(:diagnose, stub_model(Diagnose,
      :code => "Code",
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
