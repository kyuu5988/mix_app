class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"

    # stream_fromとは、サーバーとクライアントを関連付けるメソッド
    stream_from "comment_channel"
    
  end

  #note
  # stream_fromメソッドで関連付けられるデータの経路のことを、broadcast（ブロードキャスト）と呼びます

  # broadcastとは、サーバーから送られるデータの経路のことを指します。
  # broadcastを介してデータをクライアントに送信

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
