require 'spec_helper'

describe "medicaments/index" do
  before(:each) do
    assign(:medicaments, [
      stub_model(Medicament,
        :code => "Code",
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Medicament,
        :code => "Code",
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of medicaments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end