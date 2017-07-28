$(function() {
  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/groups/search',
      data: { keyword: input },
      dataType: 'json',
    }).done(function(users){
      if (users.length !== 0) {
        $('#chat-group-user-search').remove();
        $.each(users, function(index, user){
          $('#chat-member').append(appendUser(user));
          if (input === ""){
            $('#chat-group-user-search').remove();
            return;
          }
        });
      } else {
        console.log("No users");
      }
    }).fail(function(){
      alert("失敗しました。");
    });
  });

  var array = new Array();

  $(document).on("click", "#add", function(){
    var $id = $(this).data("user-id");
    var $name = $(this).data("user-name");
    if(array.indexOf($name) >= 0){
      alert("その人物はすでに追加されています");
      return;
    }
    $('.chat-group-form__field--right--member').append(addUser($id, $name));
    $(this).parent().remove();
     array.push($name);
  });

  $(document).on("click", "#delete", function(){
    var $name = $(this).parent().find('p').text();
    $(this).parent().remove();
    var idx = array.indexOf($name);
    if(idx >= 0){
      array.splice(idx, 1);

    }
  });

  function addUser(id, name){
    var html = '<div class="chat-group-user clearfix" id="chat-group-user-add">'
            + '<input name="group[user_ids][]" type="hidden" value="' + id + '">'
            + '<p class="chat-group-user__name">'
            + name
            +'</p>'
            +'<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" id="delete" data-user-id="' + id + '" data-user-name="' + name + '">'
            + 削除
            + '</a>'
            + '</div>';
    return html;
  }

  function appendUser(user) {
   　var html = '<div class="chat-group-user clearfix" id="chat-group-user-search">'
              + '<input name="chat_group[user_ids][]" type="hidden" value="' + user.id + '">'
              + '<p class="chat-group-user__name">'
              + user.name
              + '</p>'
              + '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" id="add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">'
              + 追加
              + '</a>'
              + '</div>';
    return html;
  }
});

