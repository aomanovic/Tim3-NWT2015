require "spec_helper"

describe TmLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/tm_links").should route_to("tm_links#index")
    end

    it "routes to #new" do
      get("/tm_links/new").should route_to("tm_links#new")
    end

    it "routes to #show" do
      get("/tm_links/1").should route_to("tm_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tm_links/1/edit").should route_to("tm_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tm_links").should route_to("tm_links#create")
    end

    it "routes to #update" do
      put("/tm_links/1").should route_to("tm_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tm_links/1").should route_to("tm_links#destroy", :id => "1")
    end

  end
end
