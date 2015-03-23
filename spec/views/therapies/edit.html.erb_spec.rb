require 'spec_helper'

describe "therapies/edit" do
  before(:each) do
    @therapy = assign(:therapy, stub_model(Therapy,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit therapy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", therapy_path(@therapy), "post" do
      assert_select "input#therapy_code[name=?]", "therapy[code]"
      assert_select "input#therapy_name[name=?]", "therapy[name]"
      assert_select "textarea#therapy_description[name=?]", "therapy[description]"
    end
  end
end
