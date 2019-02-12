class UsersController < ApplicationController

   def new
        flash[:error]=[]
        @user=User.new
   end
   
   def create
        user=User.new(user_params)
        if params[:user][:password] == params[:user][:confirm_password]
            user.save
            session[:user_id]=user.id
            redirect_to "/home/users/#{user.id}"
        else
            flash[:error]=[]
            flash[:error]=user.errors.full_messages
            render :new
        end
   end

   def show
      @user=User.find(params[:id])
   end


   private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :display_name, :password)
   end
end
