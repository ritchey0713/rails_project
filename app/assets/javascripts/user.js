function Game(attr){
this.id = attr.id
this.name = attr.name
this.game_type = attr.game_type
this.play_time = attr.play_time
this.main_setup = attr.main_setup
this.score = attr.score
}

// getting the game edit form
$(function(){
  $(".js-userGameEdit").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(response){
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
  $("form").click(function(e){
    e.preventDefault()
  })
})


$(function(){
  $("a.js-addGame").click(function(e){
    e.preventDefault()
    $.get(this.href).success(function(resp){
      $("div.ajaxForm").html(resp)
    }).error(function(){
      window.location.replace("Logged_in_home")
    })
  })
})

Game.prototype.user_id = $(function(){
  $("h1").data("user-id")
})
// use handlebars for json index
$(function(){
   $(".js-gameIndex").one("click",function(e){

     e.preventDefault()
     $.getJSON(this.href,function(games_array){
         //var user_id = $("h1").data("user-id")
      games_array.forEach(function(game){
        var new_game = new Game(game)
        var gameLi = new_game.renderLI()
        //var user_id = $("h1").data("user-id")
        //debugger
        $("ul#games_list").append(gameLi)

      })
    })
   })
 })

 $(function(){
Game.templateSource = $("#games-template").html();
Game.template = Handlebars.compile($("#games-template").html());
 })

Game.prototype.renderLI = function(){
  return Game.template(this)
}
