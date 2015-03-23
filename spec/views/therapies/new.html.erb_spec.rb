require 'spec_helper'

describe "therapies/new" do
  before(:each) do
    assign(:therapy, stub_model(Therapy,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new therapy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", therapies_path, "post" do
      assert_select "input#therapy_code[name=?]", "therapy[code]"
      assert_select "input#therapy_name[name=?]", "therapy[name]"
      assert_select "textarea#therapy_description[name=?]", "therapy[description]"
    end
  end
end
