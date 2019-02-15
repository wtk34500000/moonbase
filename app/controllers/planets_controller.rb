class PlanetsController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index]

    #index page for all the planets
    def index
        @planets=Planet.all
    end

    #display for single planet
    def show
        @planet=Planet.find(params[:id])
        
    end
end
