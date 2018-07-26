
// getting the game edit form
$(function(){
  $(".js-userGameEdit").click(function(e){
    e.preventDefault()
    $.get(this.href, "json").success(function(response){
      console.log(response)
      // inject repsonse into page
      $("div.ajaxForm").html(response)
    }).error(function(){
      window.location.replace("Logged_in_home")
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

$(function(){
  $(".js-gameIndex").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(json){
      $("div.js-inject ol").html(json)

      })
  })
})
