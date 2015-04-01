require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EsLinksController do

  # This should return the minimal set of attributes required to create a valid
  # EsLink. As you add validations to EsLink, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "EvidentionID" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EsLinksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all es_links as @es_links" do
      es_link = EsLink.create! valid_attributes
      get :index, {}, valid_session
      assigns(:es_links).should eq([es_link])
    end
  end

  describe "GET show" do
    it "assigns the requested es_link as @es_link" do
      es_link = EsLink.create! valid_attributes
      get :show, {:id => es_link.to_param}, valid_session
      assigns(:es_link).should eq(es_link)
    end
  end

  describe "GET new" do
    it "assigns a new es_link as @es_link" do
      get :new, {}, valid_session
      assigns(:es_link).should be_a_new(EsLink)
    end
  end

  describe "GET edit" do
    it "assigns the requested es_link as @es_link" do
      es_link = EsLink.create! valid_attributes
      get :edit, {:id => es_link.to_param}, valid_session
      assigns(:es_link).should eq(es_link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EsLink" do
        expect {
          post :create, {:es_link => valid_attributes}, valid_session
        }.to change(EsLink, :count).by(1)
      end

      it "assigns a newly created es_link as @es_link" do
        post :create, {:es_link => valid_attributes}, valid_session
        assigns(:es_link).should be_a(EsLink)
        assigns(:es_link).should be_persisted
      end

      it "redirects to the created es_link" do
        post :create, {:es_link => valid_attributes}, valid_session
        response.should redirect_to(EsLink.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved es_link as @es_link" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsLink.any_instance.stub(:save).and_return(false)
        post :create, {:es_link => { "EvidentionID" => "invalid value" }}, valid_session
        assigns(:es_link).should be_a_new(EsLink)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EsLink.any_instance.stub(:save).and_return(false)
        post :create, {:es_link => { "EvidentionID" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested es_link" do
        es_link = EsLink.create! valid_attributes
        # Assuming there are no other es_links in the database, this
        # specifies that the EsLink created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EsLink.any_instance.should_receive(:update).with({ "EvidentionID" => "1" })
        put :update, {:id => es_link.to_param, :es_link => { "EvidentionID" => "1" }}, valid_session
      end

      it "assigns the requested es_link as @es_link" do
        es_link = EsLink.create! valid_attributes
        put :update, {:id => es_link.to_param, :es_link => valid_attributes}, valid_session
        assigns(:es_link).should eq(es_link)
      end

      it "redirects to the es_link" do
        es_link = EsLink.create! valid_attributes
        put :update, {:id => es_link.to_param, :es_link => valid_attributes}, valid_session
        response.should redirect_to(es_link)
      end
    end

    describe "with invalid params" do
      it "assigns the es_link as @es_link" do
        es_link = EsLink.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EsLink.any_instance.stub(:save).and_return(false)
        put :update, {:id => es_link.to_param, :es_link => { "EvidentionID" => "invalid value" }}, valid_session
        assigns(:es_link).should eq(es_link)
      end

      it "re-renders the 'edit' template" do
        es_link = EsLink.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EsLink.any_instance.stub(:save).and_return(false)
        put :update, {:id => es_link.to_param, :es_link => { "EvidentionID" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested es_link" do
      es_link = EsLink.create! valid_attributes
      expect {
        delete :destroy, {:id => es_link.to_param}, valid_session
      }.to change(EsLink, :count).by(-1)
    end

    it "redirects to the es_links list" do
      es_link = EsLink.create! valid_attributes
      delete :destroy, {:id => es_link.to_param}, valid_session
      response.should redirect_to(es_links_url)
    end
  end

end
