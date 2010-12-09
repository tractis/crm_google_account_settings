class GoogleAccountsController < ApplicationController
  before_filter :require_user
  
  require "gdata4ruby"

  # POST /google_account/settings
  # ------------------------------------------------------------------------------
  def settings
    account = @current_user.pref[:google_account] = params[:google_account]
    password = @current_user.pref[:google_password] = params[:google_password]
    
    if account.blank?
      flash[:error] = "#{t :missing_account}"
    # TODO(ibolmo): Stronger email validation
    elsif not account.match('@')
      flash[:error] = "#{t :invalid_account}"
    elsif password.blank?
      flash[:error] = "#{t :missing_password}"
    end
    return redirect_to :controller => 'profile' if flash[:error]
    
    begin
      service = GData4Ruby::Service.new()
      service.authenticate(account, password, 'cl')
      
      flash[:notice] = "#{t :your_google_account, account}"
    rescue GData4Ruby::HTTPRequestFailed => e
      flash[:error] = "#{t :auth_failed}"
      @current_user.pref[:google_password] = nil
    end
    redirect_to :controller => "profile"
  end
  
end
