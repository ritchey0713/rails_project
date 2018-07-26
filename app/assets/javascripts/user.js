
// getting the game edit form
$(function(){
  $(".js-userGameEdit").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(response){
      // inject repsonse into page
      $("div.editForm").html(response)
    }).error(function(){
      window.location.replace(`"users/ + ${id} +/games"`)
    })
  })
  $(".js-submit")
})
