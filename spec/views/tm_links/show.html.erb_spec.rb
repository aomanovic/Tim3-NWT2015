require 'spec_helper'

describe "tm_links/show" do
  before(:each) do
    @tm_link = assign(:tm_link, stub_model(TmLink,
      :TherapyID => 1,
      :MedicamentID => 2,
      :Quantity => "Quantity",
      :Description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Quantity/)
    rendered.should match(/Description/)
  end
end
