require 'spec_helper'

describe "visits/edit" do
  before(:each) do
    @visit = assign(:visit, stub_model(Visit,
      :PersonID => 1,
      :MedicalStuffID => 1
    ))
  end

  it "renders the edit visit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", visit_path(@visit), "post" do
      assert_select "input#visit_PersonID[name=?]", "visit[PersonID]"
      assert_select "input#visit_MedicalStuffID[name=?]", "visit[MedicalStuffID]"
    end
  end
end
