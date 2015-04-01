require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :Name => "Name",
      :Surname => "Surname",
      :UserTypeID => 1,
      :Address => "Address",
      :Telephone => "Telephone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Surname/)
    rendered.should match(/1/)
    rendered.should match(/Address/)
    rendered.should match(/Telephone/)
  end
end
