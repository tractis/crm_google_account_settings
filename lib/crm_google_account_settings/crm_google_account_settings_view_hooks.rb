class CrmGoogleAccountSettingsViewHooks < FatFreeCRM::Callback::Base
  
  PROFILE_EDIT = <<EOS
%br
- form_tag('/google_accounts/settings') do
  .subtitle= t :google_account_settings
  .section
    %table{ :width => 500, :cellpadding => 0, :cellspacing => 0 }
      %tr
        %td{ :valign => :top, :colspan => 3 }
          .label.top.req= t :account
          = text_field_tag 'google_account', @current_user.pref[:google_account], :style => "width:240px"
        %td= spacer
        %td{ :valign => :top, :colspan => 3 }
          .label.top= t :password
          = password_field_tag 'google_password', nil, :style => "width:240px"
      %tr          
        %td{ :valign => :top, :colspan => 3 }
          = submit_tag "save"
        %td= spacer                 
EOS
  
  PROFILE_SHOW = <<EOS
.subtitle= t :google_account_settings
.section
  - if @current_user.pref[:google_account].blank? || @current_user.pref[:google_password].blank?
    .label= t(:no_google_account)
  - else
    = label= t(:your_google_account, @current_user.pref[:google_account])
EOS

  define_method :profile_user_bottom do |view, context|
    Haml::Engine.new(PROFILE_EDIT).render(view)
  end

  define_method :show_user_bottom do |view, context|
    Haml::Engine.new(PROFILE_SHOW).render(view)
  end
  
end
