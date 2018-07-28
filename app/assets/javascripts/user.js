//constructor prototype
function Game(attr, user_id){
    this.id = attr.id
    this.name = attr.name
    this.game_type = attr.game_type
    this.play_time = attr.play_time
    this.main_setup = attr.main_setup
    this.score = attr.score
    this.user_id = user_id
}

$(function(){
    Game.templateSource = $("#games-template").innerHTML;
    Game.template = Handlebars.compile($("#games-template").html());
})

$(function(){
    Game.editSource = $("#edit-game-template").innerHTML;
    Game.editTemplate = Handlebars.compile($("#edit-game-template").html());
})

Game.prototype.renderLI = function(){
    return Game.template(this)
}

Game.success = function(resp){
  $("ul.games_list").html(resp)
}

$(function(){
    $("a.js-addGame").one("click",function(e){
      e.preventDefault()
      $.get(this.href).success(Game.success)
    })
      .error(function(){
        window.location.replace("Logged_in_home")
      })
})

//submit the new form via json
$(function(){
  $("form#new_game").submit(function(e){
    var action = this.action
    var params = $(this).serialize()
    e.preventDefault()
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
      })
      .success(function(json){
        var user_id = $("h1").data("user-id")
        var game = new Game(json, user_id)
        gameLI = game.renderLI()
        $("ul.games_list").append(gameLI)
      })
      .error(function(resp){
        console.log("you got an error??", resp)
        })
  })
})

// handlebars template for index of games
$(function(){
   $(".js-gameIndex").click(function(e){

     e.preventDefault()
     $.getJSON(this.href,function(games_array){
      games_array.forEach(function(game){
        var user_id = $("h1").data("user-id")
        var new_game = new Game(game, user_id)
        var gameLi = new_game.renderLI()
        $("ul.games_list").append(gameLi)


      })
    })
   })
 })

 // game details
 $(function() {
   $(document).on('click', 'a#showGame', function(e) {
     e.preventDefault()
     $.getJSON(this.href, function(game){
       // event to remove index
       // $("ul.games_list").remove()
       $(".showHeading").html(`Full details`)
       $(".gameName").text(`Game: ${game["name"]}`)
       $(".gameType").text(`Game Type: ${game["game_type"]}`)
       $(".gameTime").text(`Game Time: ${game["play_time"]}`)
       $(".gameSetup").text(`Gear Setup: ${game["main_setup"]}`)
       $(".gameScore").text(`Ranking Score: ${game["score"]}`)

     })
   })
 })

 // grab the edit form
 $(function(){
   $(document).on("click", 'a#editGame', function(e){
     e.preventDefault()
     $.get(this.href).success(Game.success).error(function(){
       window.location.replace("Logged_in_home")
       })
     })
   })

// submit edit form
$(function(){
  $("form").submit(function(e){
    var action = this.action
    var params = $(this).serialize()
    e.preventDefault()
      $.post(action, params,Game. success)
    })
  })
