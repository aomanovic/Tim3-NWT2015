require 'spec_helper'

describe "measurements/index" do
  before(:each) do
    assign(:measurements, [
      stub_model(Measurement,
        :PersonID => 1,
        :VP1 => "Vp1",
        :VP2 => "Vp2",
        :VP3 => "Vp3"
      ),
      stub_model(Measurement,
        :PersonID => 1,
        :VP1 => "Vp1",
        :VP2 => "Vp2",
        :VP3 => "Vp3"
      )
    ])
  end

  it "renders a list of measurements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Vp1".to_s, :count => 2
    assert_select "tr>td", :text => "Vp2".to_s, :count => 2
    assert_select "tr>td", :text => "Vp3".to_s, :count => 2
  end
end
