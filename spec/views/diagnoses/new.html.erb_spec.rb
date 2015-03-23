require 'spec_helper'

describe "diagnoses/new" do
  before(:each) do
    assign(:diagnose, stub_model(Diagnose,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new diagnose form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diagnoses_path, "post" do
      assert_select "input#diagnose_code[name=?]", "diagnose[code]"
      assert_select "input#diagnose_name[name=?]", "diagnose[name]"
      assert_select "textarea#diagnose_description[name=?]", "diagnose[description]"
    end
  end
end
