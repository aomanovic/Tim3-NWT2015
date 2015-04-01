require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :Name => "MyString",
      :Surname => "MyString",
      :UserTypeID => 1,
      :Address => "MyString",
      :Telephone => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", people_path, "post" do
      assert_select "input#person_Name[name=?]", "person[Name]"
      assert_select "input#person_Surname[name=?]", "person[Surname]"
      assert_select "input#person_UserTypeID[name=?]", "person[UserTypeID]"
      assert_select "input#person_Address[name=?]", "person[Address]"
      assert_select "input#person_Telephone[name=?]", "person[Telephone]"
    end
  end
end
