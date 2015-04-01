require "spec_helper"

describe AnamnesesController do
  describe "routing" do

    it "routes to #index" do
      get("/anamneses").should route_to("anamneses#index")
    end

    it "routes to #new" do
      get("/anamneses/new").should route_to("anamneses#new")
    end

    it "routes to #show" do
      get("/anamneses/1").should route_to("anamneses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/anamneses/1/edit").should route_to("anamneses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/anamneses").should route_to("anamneses#create")
    end

    it "routes to #update" do
      put("/anamneses/1").should route_to("anamneses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/anamneses/1").should route_to("anamneses#destroy", :id => "1")
    end

  end
end
