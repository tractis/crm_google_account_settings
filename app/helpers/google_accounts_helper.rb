module GoogleAccountsHelper

  #----------------------------------------------------------------------------
  def google_account_is_defined
    return true unless @current_user.pref[:google_account].blank? || @current_user.pref[:google_password].blank?
  end
  
end