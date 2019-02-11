class SessionsController < ApplicationController
    def new
    end

    def create    
        user=User.find_by(email: params[:email])
        if user.valid? 
            user=user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to "/home"
        else
            flash[:error]=[]
            flash[:error]=user.errors.full_messages
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/home/login"
   end
    

end