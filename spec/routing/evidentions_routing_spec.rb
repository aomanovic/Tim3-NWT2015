require "spec_helper"

describe EvidentionsController do
  describe "routing" do

    it "routes to #index" do
      get("/evidentions").should route_to("evidentions#index")
    end

    it "routes to #new" do
      get("/evidentions/new").should route_to("evidentions#new")
    end

    it "routes to #show" do
      get("/evidentions/1").should route_to("evidentions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/evidentions/1/edit").should route_to("evidentions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/evidentions").should route_to("evidentions#create")
    end

    it "routes to #update" do
      put("/evidentions/1").should route_to("evidentions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/evidentions/1").should route_to("evidentions#destroy", :id => "1")
    end

  end
end
