require 'spec_helper'

describe "dt_links/show" do
  before(:each) do
    @dt_link = assign(:dt_link, stub_model(DtLink,
      :DiagnoseID => 1,
      :TherapyID => 2,
      :Description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
  end
end
