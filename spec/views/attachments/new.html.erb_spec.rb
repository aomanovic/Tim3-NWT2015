require 'spec_helper'

describe "attachments/new" do
  before(:each) do
    assign(:attachment, stub_model(Attachment,
      :EvidentionID => 1,
      :Image => "MyString"
    ).as_new_record)
  end

  it "renders new attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachments_path, "post" do
      assert_select "input#attachment_EvidentionID[name=?]", "attachment[EvidentionID]"
      assert_select "input#attachment_Image[name=?]", "attachment[Image]"
    end
  end
end
