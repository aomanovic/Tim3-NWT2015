require 'spec_helper'

describe "DtLinks" do
  describe "GET /dt_links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dt_links_path
      response.status.should be(200)
    end
  end
end
