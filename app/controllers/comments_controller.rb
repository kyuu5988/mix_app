class CommentsController < ApplicationController
  def create
    #pic2参考の通常のコメント投稿
    #comment = Comment.create(comment_params)
    #redirect_to "/tweets/#{comment.tweet.id}"

    
    #action cable
    #1 以下の1行のみ
    @comment = Comment.new(msg: params[:comment][:msg])

    #2 channel作成後
    # メッセージの保存が成功したときに、broadcastを介してメッセージが送信されるように記述
    if Comment.create(comment_params)
      ActionCable.server.broadcast 'comment_channel', content: @comment
      # broadcastを通して、'comment_channel'に向けて@commentを送信する
    end
    # 送信された情報は、comment_channel.jsで受け取り

  end

  private
  def comment_params
    params.require(:comment).permit(:msg).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
