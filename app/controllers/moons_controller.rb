class MoonsController < ApplicationController
    def index
        @moons=Moon.all
    end

    def show
        @moon=Moon.find(params[:id])
    end
end
