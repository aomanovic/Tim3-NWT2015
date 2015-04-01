require "spec_helper"

describe DtLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/dt_links").should route_to("dt_links#index")
    end

    it "routes to #new" do
      get("/dt_links/new").should route_to("dt_links#new")
    end

    it "routes to #show" do
      get("/dt_links/1").should route_to("dt_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dt_links/1/edit").should route_to("dt_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dt_links").should route_to("dt_links#create")
    end

    it "routes to #update" do
      put("/dt_links/1").should route_to("dt_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dt_links/1").should route_to("dt_links#destroy", :id => "1")
    end

  end
end
