class MoonsController < ApplicationController
    def index
    end

    def show
        @moon=Moon.find(params[:id])
    end
end
