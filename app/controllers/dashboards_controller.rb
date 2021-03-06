class DashboardsController < ApplicationController
# Check for active session 
before_action :authenticate_user!

  def home
    if true
      @business_rules_index   = BusinessRule.pgnd(current_playground).order("score ASC").limit(10)
      @business_rules_updated = BusinessRule.pgnd(current_playground).order("updated_at DESC").limit(10)
      @business_rules_search  = BusinessRule.pgnd(current_playground).search(params[:criteria]).limit(10)
      @playground_measured    = Playground.find(current_playground)
    end 
  end

end
