class LotteryController < ApplicationController
  layout 'lottery', only: [:index]
  before_action :authorized
  
  def index
    @user = User.find(params[:id])
  end

  def lotto_win
    #code
    @user = User.find(params[:id])
    if @user.lottery_win?
      @user.get_random_moon
      redirect_to "/home/users/#{@user.id}"
    else
      redirect_to "/home/users/#{@user.id}/lottery"
    end
  end
end
