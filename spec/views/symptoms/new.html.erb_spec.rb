require 'spec_helper'

describe "symptoms/new" do
  before(:each) do
    assign(:symptom, stub_model(Symptom,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new symptom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", symptoms_path, "post" do
      assert_select "input#symptom_code[name=?]", "symptom[code]"
      assert_select "input#symptom_name[name=?]", "symptom[name]"
      assert_select "textarea#symptom_description[name=?]", "symptom[description]"
    end
  end
end
