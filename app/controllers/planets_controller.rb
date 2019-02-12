class PlanetsController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index]

    def index
        @planets=Planet.all
    end

    def show
        @planet=Planet.find(params[:id])
    end

end
