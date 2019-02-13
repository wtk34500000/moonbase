class ApplicationController < ActionController::Base
    helper_method :current_user, :log_in?, :authorized

    def current_user
        if session[:user_id]
            @current_user= User.find(session[:user_id])
        end
    end

    def log_in?
        !!current_user
    end

    def authorized
        return redirect_to "/home/login" unless log_in?
    end
end
