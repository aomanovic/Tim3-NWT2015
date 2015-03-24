require 'spec_helper'

describe "diagnoses/edit" do
  before(:each) do
    @diagnose = assign(:diagnose, stub_model(Diagnosis,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit diagnose form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diagnose_path(@diagnose), "post" do
      assert_select "input#diagnose_code[name=?]", "diagnose[code]"
      assert_select "input#diagnose_name[name=?]", "diagnose[name]"
      assert_select "textarea#diagnose_description[name=?]", "diagnose[description]"
    end
  end
end
