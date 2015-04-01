require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :Name => "MyString",
      :Surname => "MyString",
      :UserTypeID => 1,
      :Address => "MyString",
      :Telephone => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_Name[name=?]", "person[Name]"
      assert_select "input#person_Surname[name=?]", "person[Surname]"
      assert_select "input#person_UserTypeID[name=?]", "person[UserTypeID]"
      assert_select "input#person_Address[name=?]", "person[Address]"
      assert_select "input#person_Telephone[name=?]", "person[Telephone]"
    end
  end
end
