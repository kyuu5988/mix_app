class TweetsController < ApplicationController




  def index#1
    #@tweets = Tweet.all#1
    @tweets = Tweet.all.order("created_at DESC")
  end

  def new#2
    @tweet = Tweet.new
  end

  def create#3    
    Tweet.create(tweet_params)

    redirect_to root_path
  end

  def destroy#5
    tweet = Tweet.find(params[:id])
    #binding.pry #検証用
    tweet.destroy

    redirect_to root_path
  end


  private

  def tweet_params#4
    params.require(:tweet).permit(:text, :image)#.merge(user_id: current_user.id)
    # :imageはactive storage用
  end



end
