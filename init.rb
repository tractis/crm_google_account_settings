require "fat_free_crm"

FatFreeCRM::Plugin.register(:crm_google_account_settings, initializer) do
          name "Google account settings for users"
       authors "Tractis - https://www.tractis.com - Jose Luis Gordo Romero"
       version "0.1"
   description "Let users store their google account setting for use in other plugins"
  dependencies :haml  
end

require "crm_google_account_settings"