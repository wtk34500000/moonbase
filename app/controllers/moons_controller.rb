class MoonsController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index]

    def index
        @moons=Moon.all
    end

    def show
        @moon=Moon.find(params[:id])
    end
end
