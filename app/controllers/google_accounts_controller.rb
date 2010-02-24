class GoogleAccountsController < ApplicationController
  before_filter :require_user

  # POST /google_account/settings
  # ------------------------------------------------------------------------------
  def settings
    @current_user.pref[:google_account] = params[:google_account] if params[:google_account]
    @current_user.pref[:google_password] = params[:google_password] unless params[:google_password].blank?
    redirect_to :controller => "profile"
  end
  
end
