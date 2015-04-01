require 'spec_helper'

describe "measurements/edit" do
  before(:each) do
    @measurement = assign(:measurement, stub_model(Measurement,
      :PersonID => 1,
      :VP1 => "MyString",
      :VP2 => "MyString",
      :VP3 => "MyString"
    ))
  end

  it "renders the edit measurement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", measurement_path(@measurement), "post" do
      assert_select "input#measurement_PersonID[name=?]", "measurement[PersonID]"
      assert_select "input#measurement_VP1[name=?]", "measurement[VP1]"
      assert_select "input#measurement_VP2[name=?]", "measurement[VP2]"
      assert_select "input#measurement_VP3[name=?]", "measurement[VP3]"
    end
  end
end
