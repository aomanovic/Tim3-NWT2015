require 'spec_helper'

describe "user_types/index" do
  before(:each) do
    assign(:user_types, [
      stub_model(UserType,
        :Code => "Code",
        :Name => "Name",
        :Description => "Description"
      ),
      stub_model(UserType,
        :Code => "Code",
        :Name => "Name",
        :Description => "Description"
      )
    ])
  end

  it "renders a list of user_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
