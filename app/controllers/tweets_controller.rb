class TweetsController < ApplicationController




  def index
    @tweets = Tweet.all#1
  end



end
