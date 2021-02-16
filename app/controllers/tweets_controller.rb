class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]#6
  before_action :move_to_index, except: [:index, :show, :kensaku]

  def index#1
    #@tweets = Tweet.all#1-1
    #@tweets = Tweet.all.order("created_at DESC")#1-2
    @tweets = Tweet.includes(:user).order("created_at DESC")#1-3
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

  def update#7
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path(params[:id]), notice: '投稿が更新されました。'
    else
      flash[:not_input] = "何も入力されていません。"
      render :edit
    end
  end

  def show#6    
  end

  def kensaku
    #render plain: "kensakuアクションが動作した" #動作確認用
    #binding.pry #検証用 (ターミナルで"params"と入れるとデータ確認できる)
    @tweets = Tweet.search(params[:key_wd])
    #インスタンス変数 = モデル.メソッド(検索内容)→モデル内のメソッド呼び出し
  end


  private

  def tweet_params#4
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
    # :imageはactive storage用
    #.merge(user_id: current_user.id)はuser機能追加後に記述
  end

  def set_tweet#6
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
