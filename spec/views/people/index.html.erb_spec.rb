require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :Name => "Name",
        :Surname => "Surname",
        :UserTypeID => 1,
        :Address => "Address",
        :Telephone => "Telephone"
      ),
      stub_model(Person,
        :Name => "Name",
        :Surname => "Surname",
        :UserTypeID => 1,
        :Address => "Address",
        :Telephone => "Telephone"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Telephone".to_s, :count => 2
  end
end
