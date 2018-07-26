
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
//edit form submission
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

// get request for game index
$(function(){
  $(".js-gameIndex").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(json){
      $("div.js-inject ol").html(json)

      })
  })
})

// game show specifics 
