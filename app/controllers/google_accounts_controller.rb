class GoogleAccountsController < ApplicationController
  before_filter :require_user
  
  require "gdata4ruby"

  # POST /google_account/settings
  # ------------------------------------------------------------------------------
  def settings
    account = @current_user.pref[:google_account] = params[:google_account]
    password = @current_user.pref[:google_password] = params[:google_password]
    
    if account.blank?
      flash[:error] = 'Please provide your Google Account.'
    # TODO(ibolmo): Stronger email validation
    elsif not account.match('@')
      flash[:error] = 'Google Account should be an email address.'
    elsif password.blank?
      flash[:error] = 'No password given.'
    end
    return redirect_to :controller => 'profile' if flash[:error]
    
    begin
      service = GData4Ruby::Service.new()
      service.authenticate(account, password, 'cl')
      
      flash[:notice] = 'Google Account saved.'   
    rescue GData4Ruby::HTTPRequestFailed => e
      flash[:error] = 'Authentication failed. Check your account and password.'
      @current_user.pref[:google_password] = nil
    end
    redirect_to :controller => "profile"
  end
  
end
