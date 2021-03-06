class ScopesController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!

# Retrieve current business area
  before_action :set_scope, only: [:show, :edit, :update, :destroy]

# Create the list statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]
  
  # GET /scopes
  # GET /scopes.json
  def index
    @scopes = Scope.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scopes }
    end
  end

  # GET /scopes/1
  # GET /scopes/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /scopes/new
  # GET /scopes/new.json
  def new
    @landscape = Landscape.find(params[:landscape_id])
    @scope = Scope.new
  end

  # GET /scopes/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /scopes
  # POST /scopes.json
  def create
    @landscape = Landscape.find(params[:landscape_id])
    @scope = @landscape.scopes.build(scope_params)
    metadata_setup(@scope)   

    respond_to do |format|
      if @scope.save
        format.html { redirect_to @scope, notice: 'Scope was successfully created.' }
        format.json { render json: @scope, status: :created, location: @scope }
      else
        format.html { render action: "new" }
        format.json { render json: @scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scopes/1
  # PUT /scopes/1.json
  def update
    ### Retrieved by Callback function
    @scope.updated_by = current_user.user_name    

    respond_to do |format|
      if @scope.update_attributes(scope_params)
        format.html { redirect_to @scope, notice: 'Scope was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scopes/1
  # DELETE /scopes/1.json
  def destroy
    ### Retrieved by Callback function
    @scope.destroy

    respond_to do |format|
      format.html { redirect_to scopes_url }
      format.json { head :no_content }
    end
  end
  


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current scope
    def set_scope
      @scope = Scope.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters

  ### strong parameters
  def scope_params
    params.require(:scope).permit(:code, :name, :status_id, :description, :load_interface, :sql_query, :db_technology, :db_connection, :db_owner_schema, :structure_name,)
  end

  
end
