import consumer from "./consumer"

function insertMessage(data, current_user_id){
  var message = data.resource;
  var class_name = current_user_id === message.user_id ? 'message-sent' : 'message-received';
  var li_side = current_user_id === message.user_id ? 'float: right;' : '';
  $('#messages').append(`<li class="col-12" style="${li_side}">
        <div>
          <div class="${class_name}">
            ${message.body}
          </div>
        </div>
      </li>`);

  // scroll to bottom of the chat
  var objDiv = document.getElementById("chat");
  objDiv.scrollTop = objDiv.scrollHeight;
}

function SendMessage(){
  $(document).on('submit', '.new_message', function(e) {
    e.preventDefault();
    var values = $(this).serializeArray();
    var data = { };
    $.each(values, function (index, value) {
      data[value.name] = value.value;
    })
    consumer.conversation.speak(data);
    $(this).trigger('reset');
  });
}

$(function() {
  consumer.conversation = consumer.subscriptions.create({ channel: "ChatRoomChannel",
    chat_room_id: $("#messages").data('chat-room-id')} , {
    connected: function() {},

    disconnected: function() {},

    received: function(data) { insertMessage(data, current_user_id) },

    speak: function(data) {
      return this.perform('speak', data);
    }
  });
  SendMessage();
});

