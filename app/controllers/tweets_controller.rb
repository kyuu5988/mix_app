class TweetsController < ApplicationController




  def index#1
    @tweets = Tweet.all#1
  end

  def new#2
    @tweet = Tweet.new
  end

  def create#3    
    Tweet.create(tweet_params)  
  end


  private

  def tweet_params#4
    params.require(:tweet).permit(:text)#.merge(user_id: current_user.id)
  end



end
