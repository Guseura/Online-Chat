import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("We are connected");
  },

  disconnected() {
    console.log("We are disconnected");
  },

  received(data) {
    var userInf = document.getElementById('bodyMain');
    var messages = $('#chatbox');
    if(userInf.dataset.curdialog == parseInt(data.dialog_id, 10)){
      if(userInf.dataset.userid != parseInt(data.user_id, 10)){
        messages.append('<div class="message_from_info"><div class="circle_new"><p>' + data.initial + '</p></div><div class="message_from"><p>' + data.content + '</p></div></div>');
      } else {
        messages.append('<div class="message_to_container"><div class="message_to_info"><div class="message_to"><p>' + data.content +'</p></div></div></div>');
      }
    }
    console.log(data);
    console.log(userInf.dataset.userid);
  }
});
