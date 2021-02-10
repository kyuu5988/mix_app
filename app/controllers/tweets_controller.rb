class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]#6


  def index#1
    #@tweets = Tweet.all#1-1
    @tweets = Tweet.all.order("created_at DESC")#1-2
  end

  def new#2
    @tweet = Tweet.new
  end

  def create#3    
    #Tweet.create(tweet_params)#3-1
    @tweet = Tweet.new(tweet_params)#3-2
    if @tweet.save
      redirect_to root_path
    else
      flash[:not_input] = "何も入力されていません。"
      render :new
    end
  end

  def destroy#5
    tweet = Tweet.find(params[:id])
    #binding.pry #検証用
    tweet.destroy

    redirect_to root_path, notice: '投稿が削除されました。'
  end

  def edit#6  
  end

  def show#6    
  end


  private

  def tweet_params#4
    params.require(:tweet).permit(:text, :image)#.merge(user_id: current_user.id)
    # :imageはactive storage用
  end

  def set_tweet#6
    @tweet = Tweet.find(params[:id])
  end



end
