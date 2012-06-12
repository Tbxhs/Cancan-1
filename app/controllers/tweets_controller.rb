class TweetsController < ApplicationController
  before_filter :require_logined#, :except => [:index, :show, :tagged, :newest]

  def new
    @tweet = Tweet.new
    @tweet.can_id = params[:can]
  end

  def create
    @tweet = Tweet.new params[:tweet]
    @tweet.user = current_user
    @tweet.type = 1
    if @tweet.save
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy if @tweet
  end
end
