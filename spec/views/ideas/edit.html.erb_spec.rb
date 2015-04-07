require 'spec_helper'

describe "ideas/edit" do
  before(:each) do
    @idea = assign(:idea, stub_model(Idea,
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString"
    ))
  end

  it "renders the edit idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do
      assert_select "input#idea_name[name=?]", "idea[name]"
      assert_select "textarea#idea_description[name=?]", "idea[description]"
      assert_select "input#idea_picture[name=?]", "idea[picture]"
    end
  end
end
