class UsersController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:new, :create]

   #sign up form 
   def new
      if log_in?
        redirect_to "/home"
      else
        @user=User.new
      end
   end

   #create new user account
   def create
        user=User.new(user_params)
        if user.valid? && params[:user][:password] == params[:user][:confirm_password]
            user.save
            session[:user_id]=user.id
            redirect_to "/home/users/#{user.id}"
        else
            flash[:error]=[]
            flash[:error]=user.errors.full_messages
            redirect_to "/home/users/new"
        end
   end

   #show user profile
   def show
        @user=User.find(params[:id])
   end

   #user edit form
   def edit
    flash[:error]=nil
     @user=User.find(params[:id])
   end

   #update user info
   def update
      @user=User.find(params[:id])
      if @user.update(user_params)
        redirect_to "/home/users/#{@user.id}"
      else
        flash[:error]=[]
        flash[:error]=@user.errors.full_messages
        render :edit
      end
   end

   def unclaim
        Moon.find(params[:moon_id]).update(user_id: nil)
        redirect_to "/home/users/#{params[:id]}"
   end

   #delete user account
   def destroy
      user=User.find(params[:id])
      user.moons.each do |moon|
        moon.update(user_id: nil)
      end
      user.destroy
      session.delete :user_id
      redirect_to "/home"
   end

   private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :display_name, :password)
   end
end
