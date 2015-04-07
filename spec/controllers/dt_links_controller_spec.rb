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

describe DtLinksController do

  # This should return the minimal set of attributes required to create a valid
  # DtLink. As you add validations to DtLink, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "DiagnoseID" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DtLinksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all dt_links as @dt_links" do
      dt_link = DtLink.create! valid_attributes
      get :index, {}, valid_session
      assigns(:dt_links).should eq([dt_link])
    end
  end

  describe "GET show" do
    it "assigns the requested dt_link as @dt_link" do
      dt_link = DtLink.create! valid_attributes
      get :show, {:id => dt_link.to_param}, valid_session
      assigns(:dt_link).should eq(dt_link)
    end
  end

  describe "GET new" do
    it "assigns a new dt_link as @dt_link" do
      get :new, {}, valid_session
      assigns(:dt_link).should be_a_new(DtLink)
    end
  end

  describe "GET edit" do
    it "assigns the requested dt_link as @dt_link" do
      dt_link = DtLink.create! valid_attributes
      get :edit, {:id => dt_link.to_param}, valid_session
      assigns(:dt_link).should eq(dt_link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DtLink" do
        expect {
          post :create, {:dt_link => valid_attributes}, valid_session
        }.to change(DtLink, :count).by(1)
      end

      it "assigns a newly created dt_link as @dt_link" do
        post :create, {:dt_link => valid_attributes}, valid_session
        assigns(:dt_link).should be_a(DtLink)
        assigns(:dt_link).should be_persisted
      end

      it "redirects to the created dt_link" do
        post :create, {:dt_link => valid_attributes}, valid_session
        response.should redirect_to(DtLink.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dt_link as @dt_link" do
        # Trigger the behavior that occurs when invalid params are submitted
        DtLink.any_instance.stub(:save).and_return(false)
        post :create, {:dt_link => { "DiagnoseID" => "invalid value" }}, valid_session
        assigns(:dt_link).should be_a_new(DtLink)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DtLink.any_instance.stub(:save).and_return(false)
        post :create, {:dt_link => { "DiagnoseID" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dt_link" do
        dt_link = DtLink.create! valid_attributes
        # Assuming there are no other dt_links in the database, this
        # specifies that the DtLink created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DtLink.any_instance.should_receive(:update).with({ "DiagnoseID" => "1" })
        put :update, {:id => dt_link.to_param, :dt_link => { "DiagnoseID" => "1" }}, valid_session
      end

      it "assigns the requested dt_link as @dt_link" do
        dt_link = DtLink.create! valid_attributes
        put :update, {:id => dt_link.to_param, :dt_link => valid_attributes}, valid_session
        assigns(:dt_link).should eq(dt_link)
      end

      it "redirects to the dt_link" do
        dt_link = DtLink.create! valid_attributes
        put :update, {:id => dt_link.to_param, :dt_link => valid_attributes}, valid_session
        response.should redirect_to(dt_link)
      end
    end

    describe "with invalid params" do
      it "assigns the dt_link as @dt_link" do
        dt_link = DtLink.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DtLink.any_instance.stub(:save).and_return(false)
        put :update, {:id => dt_link.to_param, :dt_link => { "DiagnoseID" => "invalid value" }}, valid_session
        assigns(:dt_link).should eq(dt_link)
      end

      it "re-renders the 'edit' template" do
        dt_link = DtLink.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DtLink.any_instance.stub(:save).and_return(false)
        put :update, {:id => dt_link.to_param, :dt_link => { "DiagnoseID" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dt_link" do
      dt_link = DtLink.create! valid_attributes
      expect {
        delete :destroy, {:id => dt_link.to_param}, valid_session
      }.to change(DtLink, :count).by(-1)
    end

    it "redirects to the dt_links list" do
      dt_link = DtLink.create! valid_attributes
      delete :destroy, {:id => dt_link.to_param}, valid_session
      response.should redirect_to(dt_links_url)
    end
  end

end