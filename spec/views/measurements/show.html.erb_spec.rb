require 'spec_helper'

describe "measurements/show" do
  before(:each) do
    @measurement = assign(:measurement, stub_model(Measurement,
      :PersonID => 1,
      :VP1 => "Vp1",
      :VP2 => "Vp2",
      :VP3 => "Vp3"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Vp1/)
    rendered.should match(/Vp2/)
    rendered.should match(/Vp3/)
  end
end
