require 'spec_helper'

describe "therapies/index" do
  before(:each) do
    assign(:therapies, [
      stub_model(Therapy,
        :code => "Code",
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Therapy,
        :code => "Code",
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of therapies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
