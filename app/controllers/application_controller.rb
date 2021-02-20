class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def current_user    
    end

    def logged_in?       
    end
    
    def authorized
    end
end
