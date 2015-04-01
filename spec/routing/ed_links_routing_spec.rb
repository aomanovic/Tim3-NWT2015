require "spec_helper"

describe EdLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/ed_links").should route_to("ed_links#index")
    end

    it "routes to #new" do
      get("/ed_links/new").should route_to("ed_links#new")
    end

    it "routes to #show" do
      get("/ed_links/1").should route_to("ed_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ed_links/1/edit").should route_to("ed_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ed_links").should route_to("ed_links#create")
    end

    it "routes to #update" do
      put("/ed_links/1").should route_to("ed_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ed_links/1").should route_to("ed_links#destroy", :id => "1")
    end

  end
end
