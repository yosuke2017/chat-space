$(function(){
  $('#form').on("submit", function(e){
    e.preventDefault();
    var $this = $(this);
    var formData = new FormData(this);
    console.log(formData);
    var $text = $(this).find('.message_form').val();
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
      console.log("成功");
    }).fail(function(data){
      alert('メッセージを入力してください');
      $this.val($text_field);
      console.log("失敗");
    });
    this.reset();
    return false;
  });

  function renderMessageHTML(message){
    if(message.image != null){
        var html = `<div class="content__right__under__message__header">
                  <div class="content__right__under__message__header__name">
                    ${message.user_name}
                  </div>
                  <div class="content__right__under__message__header__time">
                    ${message.created_time}
                  </div>
                </div>
                <div class="content__right__under__message__content">
                  <div class="content__right__under__message__content-text">${message.body}
                  </div>
                   <img src="${message.image}">
                </div>
                  `
    } else{
   var html = `<div class="content__right__under__message__header">
                  <div class="content__right__under__message__header__name">
                    ${message.user_name}
                  </div>
                  <div class="content__right__under__message__header__time">
                    ${message.created_time}
                  </div>
                </div>
                <div class="content__right__under__message__content">
                  <div class="content__right__under__message__content-text">${message.body}
                  </div>
                </div>
                `
      }
      return html;
  }


});

