require "spec_helper"

describe MasterMedicalFacilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/master_medical_facilities").should route_to("master_medical_facilities#index")
    end

    it "routes to #new" do
      get("/master_medical_facilities/new").should route_to("master_medical_facilities#new")
    end

    it "routes to #show" do
      get("/master_medical_facilities/1").should route_to("master_medical_facilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/master_medical_facilities/1/edit").should route_to("master_medical_facilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/master_medical_facilities").should route_to("master_medical_facilities#create")
    end

    it "routes to #update" do
      put("/master_medical_facilities/1").should route_to("master_medical_facilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/master_medical_facilities/1").should route_to("master_medical_facilities#destroy", :id => "1")
    end

  end
end
