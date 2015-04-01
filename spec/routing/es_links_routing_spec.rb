require "spec_helper"

describe EsLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/es_links").should route_to("es_links#index")
    end

    it "routes to #new" do
      get("/es_links/new").should route_to("es_links#new")
    end

    it "routes to #show" do
      get("/es_links/1").should route_to("es_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/es_links/1/edit").should route_to("es_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/es_links").should route_to("es_links#create")
    end

    it "routes to #update" do
      put("/es_links/1").should route_to("es_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/es_links/1").should route_to("es_links#destroy", :id => "1")
    end

  end
end
