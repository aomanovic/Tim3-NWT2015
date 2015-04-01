require 'spec_helper'

describe "TmLinks" do
  describe "GET /tm_links" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tm_links_path
      response.status.should be(200)
    end
  end
end
