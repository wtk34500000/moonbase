class SessionsController < ApplicationController

    #log in form
    def new
    end

    #create session for user if login 
    #and take user to he/her profile page
    def create  
        flash[:error]=nil  
        user=User.find_by(email: params[:email])
    
        if user!=nil && user.valid? && user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to "/home/users/#{user.id}"
        else
            if user!=nil
               flash[:error]="Incorrect Password"
            end
                render :new
        end
    end

    #log out
    def destroy
        session.delete :user_id
        redirect_to "/home/login"
   end
    

end