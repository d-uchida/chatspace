$(function() {

  var search_list = $("#chat_member_candidate");
  var added_chat_member = $("#added_chat_member");

  function appendUser(users) {
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name"> ${ users.name } </p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ users.id }", data-user-name= "${ users.name }">追加</a>
                </div>`
    search_list.append(html);
  }

  function appendAddedUser(id, name) {
   var html = `<div class="chat-group-user clearfix id="chat-group-user-"${id}">
               <input name="group[user_ids][]" type="hidden" value="${id}">
                 <p class="chat-group-user__name"> ${ name } </p>
                 <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${ id }", data-user-name= "${ name }">削除</a>
               </div>`

   added_chat_member.append(html);
   $(".user-search-remove").on("click", function() {
    var id = $(this).data('user-id');
    $(this).parent().remove();
  });
 }

  function NoSearchResult(No_result) {
    var html = `<div> ${No_result}</div>`
    search_list.append(html);
  }

 $("#user-search-field").on("keyup", function() {
  var input = $("#user-search-field").val();
　 console.log(input);

    $.ajax({
      type: 'GET',
      url: '/users',
      dataType: 'json',
      data: { keyword: input },
    })

    .done(function(users) {
      $("#chat_member_candidate").empty();
      if (users) {
        users.forEach(function(user) {
          appendUser(user);
        });
      }
      else {
        alert("ユーザー検索に失敗しました");
      }
    });
});

 $(".chat-group-form__field").on("click",".chat-group-user__btn", function() {
  var id = $(this).data('user-id');
  var name = $(this).data('user-name');

  appendAddedUser(id, name);
  $(this).parent().remove();

});
});

