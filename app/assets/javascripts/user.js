
// getting the game edit form
$(function(){
  $(".js-userGameEdit").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(response){
      // inject repsonse into page
      $("div.ajaxForm").html(response)
    }).error(function(){
      window.location.replace(`"users/ + ${id} +/games"`)
    })
  })
})

$(function(){
$("form").submit(function(e){
var url= this.action
var data = $(this).serialize()
  e.preventDefault()
    $.post(url, data, function(res){
     $("div.ajaxForm").html(res)
   })
})
})
