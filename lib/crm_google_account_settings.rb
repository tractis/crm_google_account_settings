require "crm_google_account_settings/crm_google_account_settings_view_hooks"

require "dispatcher"

Dispatcher.to_prepare do
  
  ActionView::Base.send(:include, GoogleAccountsHelper)

end