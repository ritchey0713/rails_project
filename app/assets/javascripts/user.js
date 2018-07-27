function Game(attr){
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
// get json index
// $(function(){
//   $(".js-gameIndex").click(function(e){
//     e.preventDefault()
//     $.getJSON(this.href,function(json){
//       console.log(json)
//       json.forEach(function(game){
//         $("div.gameName").append("<strong> Game: " ,game["name"],"</strong>", "</br>", "Game time: ", game["play_time"],"</br>", "View Details...", "</br></br>")
//       })
//     })
//   })
// })

// use handlebars for json index
$(function(){
   $(".js-gameIndex").click(function(e){
     this.user_id = $("h1").data("user-id")
     e.preventDefault()
     $.getJSON(this.href,function(games_array){
      games_array.forEach(function(game){
        var new_game = new Game(game)
        var gameLi = new_game.renderLI()
        $("ul#games_list").append(gameLi)
      })
    })
   })
 })

 $(function(){
Game.templateSource = $("#games-template").html();
Game.template = Handlebars.compile(Game.templateSource);
 })

Game.prototype.renderLI = function(){

  return Game.template(this)
}








// show individual game
$(function(){
  $("js-showGame").click(function(e){
    e.preventDefault()
    alert("hello")
  })
})
