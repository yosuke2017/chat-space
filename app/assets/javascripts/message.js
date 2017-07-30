$(function(){
  $('#form').on("submit", function(e){
    e.preventDefault();
    var $this = $(this);
    var formData = new FormData(this);
    var $text = $this.find('.message_form').val();
    var $text_field = $(this).find('.message_form');
    $text_field.val('');
    $.ajax({
      url: 'messages',
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      $('#message_area').append(renderMessageHTML(data));
      $('.content__right__under').animate({
        scrollTop: $('.content__right__under')[0].scrollHeight}, 'fast');
    }).fail(function(data){
      alert('メッセージを入力してください');
    });
    this.reset();
    return false;
  });

  function renderMessageHTML(message){
     var message_image = message.image ? '<image src= "' + message.image + '" >': "";

        var html = '<div class="content__right__under__message__header">'
                 +'<div class="content__right__under__message__header__name">'
                 + message.user_name
                 +'</div>'
                 +'<div class="content__right__under__message__header__time">'
                 + message.created_time
                 +'</div>'
                 +'</div>'
                 +'<div class="content__right__under__message__content" data-message-id="' + message.id + '" >'
                 +'<div class="content__right__under__message__content-text">'
                 + message.body
                 +'</div>'
                 + message_image
                 +'</div>';
                  return html;
  }

  function autoScroll(){
    $('.content__right__under').animate({
      scrollTop: $('.content__right__under')[0].scrollHeight}, 4000);
  }

  setInterval(function(){
    if (window.location.href.indexOf("message") === -1){
      return;
    }
    var $messages = $(".content__right__under__message__content").last();
    var id = $messages.data("message-id");
    $.ajax({
      type: 'GET',
      url: window.location.href,
      dataType: 'json',
    })
    .done(function(data){
     $.each(data, function(index, message){
       if(message.id > id ){
        console.log("success")
        $('#message_area').append(renderMessageHTML(message));
        autoScroll();
       }
     });
    }).fail(function(data){
      alert("エラー");
    })

  }, 5000);
});
