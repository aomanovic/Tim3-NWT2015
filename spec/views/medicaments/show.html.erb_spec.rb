require 'spec_helper'

describe "medicaments/show" do
  before(:each) do
    @medicament = assign(:medicament, stub_model(Medicament,
      :code => "Code",
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
