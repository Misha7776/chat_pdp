import consumer from "./consumer"

$(function() {
  var chat_room_id = $("#messages").data('chat-room-id');

  consumer.conversation = consumer.subscriptions.create({ channel: "ChatRoomChannel",
    chat_room_id: chat_room_id } , {
    connected: function() {},

    disconnected: function() {},

    received: function(data) {
      $('#messages').append(data['message']);
    },

    speak: function(data) {
      return this.perform('speak', data);
    }
  });
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
});

