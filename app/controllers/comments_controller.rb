class CommentsController < ApplicationController
  def create
    #pic2参考の通常のコメント投稿
    #comment = Comment.create(comment_params)
    #redirect_to "/tweets/#{comment.tweet.id}"

    #action cable
    #1 以下の1行のみ
    @comment = Comment.new(msg: params[:comment][:msg])

    
  end

  private
  def comment_params
    params.require(:comment).permit(:msg).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
