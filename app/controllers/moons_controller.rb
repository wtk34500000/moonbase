class MoonsController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index]

    def index
        if params[:q]
            @moon=Moon.find_by(name: params[:q].capitalize)
            if !@moon.nil?
               return redirect_to moon_path(@moon)
            end
        end
            @moons=Moon.all
            @earth=[]
            @mars=[]
            @jupiter=[]
            @saturn=[]
            @uranus=[]
            @neptune=[]
            @moons.each do |moon|
                if moon.planet_id == 1
                        @earth<<moon
                elsif moon.planet_id == 2
                        @mars<<moon
                elsif moon.planet_id == 3
                        @saturn<<moon
                elsif moon.planet_id == 4
                        @jupiter<<moon
                elsif moon.planet_id == 5
                        @uranus<<moon
                elsif moon.planet_id == 6
                        @neptune<<moon
                end
            end
    end

    def show
        @moon=Moon.find(params[:id])
        @user=User.find(current_user.id)
    end

    def update
        @moon=Moon.find(params[:id])
        @user=User.find(current_user.id)

        @moon.update(user_id: @user.id)

        redirect_to "/home/users/#{@user.id}"
    end
end
