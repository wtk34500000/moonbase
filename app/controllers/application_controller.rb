class ApplicationController < ActionController::Base
    helper_method :current_user, :log_in?, :authorized

    #get current user
    def current_user
        if session[:user_id]
            @current_user= User.find(session[:user_id])
        end
    end

    #return true if user log in
    #return false otherwise
    def log_in?
        !!current_user
    end

    #redirect to log in page if user not log in
    def authorized
        return redirect_to "/home/login" unless log_in?
    end
end
