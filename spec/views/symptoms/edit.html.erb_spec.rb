require 'spec_helper'

describe "symptoms/edit" do
  before(:each) do
    @symptom = assign(:symptom, stub_model(Symptom,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit symptom form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", symptom_path(@symptom), "post" do
      assert_select "input#symptom_code[name=?]", "symptom[code]"
      assert_select "input#symptom_name[name=?]", "symptom[name]"
      assert_select "textarea#symptom_description[name=?]", "symptom[description]"
    end
  end
end
