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

describe DataProcessesController do

  # This should return the minimal set of attributes required to create a valid
  # DataProcess. As you add validations to DataProcess, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "playground_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DataProcessesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all data_processes as @data_processes" do
      data_process = DataProcess.create! valid_attributes
      get :index, {}, valid_session
      assigns(:data_processes).should eq([data_process])
    end
  end

  describe "GET show" do
    it "assigns the requested data_process as @data_process" do
      data_process = DataProcess.create! valid_attributes
      get :show, {:id => data_process.to_param}, valid_session
      assigns(:data_process).should eq(data_process)
    end
  end

  describe "GET new" do
    it "assigns a new data_process as @data_process" do
      get :new, {}, valid_session
      assigns(:data_process).should be_a_new(DataProcess)
    end
  end

  describe "GET edit" do
    it "assigns the requested data_process as @data_process" do
      data_process = DataProcess.create! valid_attributes
      get :edit, {:id => data_process.to_param}, valid_session
      assigns(:data_process).should eq(data_process)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DataProcess" do
        expect {
          post :create, {:data_process => valid_attributes}, valid_session
        }.to change(DataProcess, :count).by(1)
      end

      it "assigns a newly created data_process as @data_process" do
        post :create, {:data_process => valid_attributes}, valid_session
        assigns(:data_process).should be_a(DataProcess)
        assigns(:data_process).should be_persisted
      end

      it "redirects to the created data_process" do
        post :create, {:data_process => valid_attributes}, valid_session
        response.should redirect_to(DataProcess.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved data_process as @data_process" do
        # Trigger the behavior that occurs when invalid params are submitted
        DataProcess.any_instance.stub(:save).and_return(false)
        post :create, {:data_process => { "playground_id" => "invalid value" }}, valid_session
        assigns(:data_process).should be_a_new(DataProcess)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DataProcess.any_instance.stub(:save).and_return(false)
        post :create, {:data_process => { "playground_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested data_process" do
        data_process = DataProcess.create! valid_attributes
        # Assuming there are no other data_processes in the database, this
        # specifies that the DataProcess created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DataProcess.any_instance.should_receive(:update).with({ "playground_id" => "1" })
        put :update, {:id => data_process.to_param, :data_process => { "playground_id" => "1" }}, valid_session
      end

      it "assigns the requested data_process as @data_process" do
        data_process = DataProcess.create! valid_attributes
        put :update, {:id => data_process.to_param, :data_process => valid_attributes}, valid_session
        assigns(:data_process).should eq(data_process)
      end

      it "redirects to the data_process" do
        data_process = DataProcess.create! valid_attributes
        put :update, {:id => data_process.to_param, :data_process => valid_attributes}, valid_session
        response.should redirect_to(data_process)
      end
    end

    describe "with invalid params" do
      it "assigns the data_process as @data_process" do
        data_process = DataProcess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DataProcess.any_instance.stub(:save).and_return(false)
        put :update, {:id => data_process.to_param, :data_process => { "playground_id" => "invalid value" }}, valid_session
        assigns(:data_process).should eq(data_process)
      end

      it "re-renders the 'edit' template" do
        data_process = DataProcess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DataProcess.any_instance.stub(:save).and_return(false)
        put :update, {:id => data_process.to_param, :data_process => { "playground_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested data_process" do
      data_process = DataProcess.create! valid_attributes
      expect {
        delete :destroy, {:id => data_process.to_param}, valid_session
      }.to change(DataProcess, :count).by(-1)
    end

    it "redirects to the data_processes list" do
      data_process = DataProcess.create! valid_attributes
      delete :destroy, {:id => data_process.to_param}, valid_session
      response.should redirect_to(data_processes_url)
    end
  end

end
