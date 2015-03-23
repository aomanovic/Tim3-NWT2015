require 'spec_helper'

describe "medicaments/new" do
  before(:each) do
    assign(:medicament, stub_model(Medicament,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new medicament form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medicaments_path, "post" do
      assert_select "input#medicament_code[name=?]", "medicament[code]"
      assert_select "input#medicament_name[name=?]", "medicament[name]"
      assert_select "textarea#medicament_description[name=?]", "medicament[description]"
    end
  end
end
