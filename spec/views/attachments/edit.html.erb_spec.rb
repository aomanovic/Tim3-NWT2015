require 'spec_helper'

describe "attachments/edit" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :EvidentionID => 1,
      :Image => "MyString"
    ))
  end

  it "renders the edit attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachment_path(@attachment), "post" do
      assert_select "input#attachment_EvidentionID[name=?]", "attachment[EvidentionID]"
      assert_select "input#attachment_Image[name=?]", "attachment[Image]"
    end
  end
end
