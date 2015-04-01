require 'spec_helper'

describe "user_types/edit" do
  before(:each) do
    @user_type = assign(:user_type, stub_model(UserType,
      :Code => "MyString",
      :Name => "MyString",
      :Description => "MyString"
    ))
  end

  it "renders the edit user_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_type_path(@user_type), "post" do
      assert_select "input#user_type_Code[name=?]", "user_type[Code]"
      assert_select "input#user_type_Name[name=?]", "user_type[Name]"
      assert_select "input#user_type_Description[name=?]", "user_type[Description]"
    end
  end
end
