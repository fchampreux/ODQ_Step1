class PlaygroundsImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @playgrounds_import = PlaygroundsImport.new
  end

  def create 
    @playgrounds_import = PlaygroundsImport.new(params[:playgrounds_import])
    if @playgrounds_import.save
      redirect_to playgrounds_path, notice: t('ImportedBPs')
    else
      render :new
    end
  end
  
end