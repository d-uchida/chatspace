$(function(){
  function buildHTML(message){
      var insertImage = '';
      if (message.image) {
        insertImage = `<img src="${message.image}">`;
    }
    var html = `
                <div class="right-messages__middle--user" data-message-id="${message.id}">
                  <div class="right-messages__middle--user__list">
                    ${message.name}
                    <span>
                      ${message.created_at}
                    </span>
                  </div>
                  <div class="right-messages__middle--message">${message.text}</div>
                  ${insertImage}
                </div>`
    return html;
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
    console.log(html);
    $('.right-messages__bottom---message_area__text').val('');
    $('.right-messages').animate({scrollTop: $("#msg")[0].scrollHeight}, 'slow');
  })
  .fail(function(){
    alert('error');
  })  
})


});