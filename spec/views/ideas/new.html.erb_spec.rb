require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ideas_path, "post" do
      assert_select "input#idea_name[name=?]", "idea[name]"
      assert_select "textarea#idea_description[name=?]", "idea[description]"
      assert_select "input#idea_picture[name=?]", "idea[picture]"
    end
  end
end
