$(function(){
  function buildHTML(message){
     if (message.text !== ""&&message.image.url !== null) {
        var html = `
                <div class="right-messages__middle--user" data-message-id="${message.id}">
                  <div class="right-messages__middle--user__list">
                    ${message.name}
                    <span>
                      ${message.created_at}
                    </span>
                  </div>
                  <div class="right-messages__middle--message">${message.text}</div>
                  <img src="${message.image.url}">
                </div>`
        return html;

      } else if (message.text !== "" && message.image.url == null){
      var html = `
                <div class="right-messages__middle--user" data-message-id="${message.id}">
                  <div class="right-messages__middle--user__list">
                    ${message.name}
                    <span>
                      ${message.created_at}
                    </span>
                  </div>
                  <div class="right-messages__middle--message">${message.text}</div>
                </div>`
       return html;

      }  else if (message.text == "" && message.image.url !== null){
      var html = `
                <div class="right-messages__middle--user" data-message-id="${message.id}">
                  <div class="right-messages__middle--user__list">
                    ${message.name}
                    <span>
                      ${message.created_at}
                    </span>
                  </div>
                  <div class="right-messages__middle--message">${message.text}</div>
                  <img src="${message.image.url}">
                </div>`
       return html;
    } else {
   }
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var href = window.location.href;

    $.ajax({
      url: href,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#msg').append(html);
      $('.right-messages__bottom---message_area__text').val('');
      $('#message_image').val('');
      $('.right-messages').animate({scrollTop: $("#msg")[0].scrollHeight}, 'slow');
    })
    .fail(function(){
      alert('error');
    })
  });

  var auto_update = function(){
    if (location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        url: location.href,
        type: 'GET',
        dataType: 'json'
      })

      .done(function(messages) {
        var latest_id = $("#msg > div:last").data('messageId');
        var insertHTML = '';
        messages.forEach(function(message) {
          if (message.id > latest_id) {
            insertHTML += buildHTML(message);
          }
        });
        $('#msg').append(insertHTML);
        $('.right-messages').animate({scrollTop: $("#msg")[0].scrollHeight}, 'slow');
        console.log("自動更新に成功しました");
      })
      .fail(function(messages) {
        alert('自動更新に失敗しました');
      });
    } else {
      clearInterval(interval);
    }
  }

  setInterval(auto_update, 5 * 1000 );

});
