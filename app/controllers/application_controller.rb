class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    def current_user
      super || guest_user
    end
    
    def guest_user
      guest = GuestUser.new
      guest.name = 'Guest User'
      guest.first_name = 'Guest'
      guest.last_name = 'User'
      guest.email = 'guest@example.com'
      guest
    end

    before_action :set_copyright

    def set_copyright
        @copyright=Francium::Renderer.copyright 'All rights reserved'
    end
end
module Francium
  class Renderer
      def self.copyright msg
          "&copy; #{Time.now.year} | <b>#{msg}</b>".html_safe
      end
  end
end 