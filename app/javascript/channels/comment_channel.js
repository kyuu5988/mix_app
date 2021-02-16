import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // 1, 受け取った情報は、receivedの引数dataに入ります
  received(data) {
    // 2, データをテンプレートリテラルにして、viewに挿入

    const html = `%p ${data.content.msg}`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_msg');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }

});

// 16行目で受け取ったdataの中にあるcontentの中のmsgを表示します。
// contentはコントローラーのcreateアクション内で指定したcontentからきています。contentは@messageと同義なので、textを取り出せる
