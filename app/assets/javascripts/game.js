//constructor prototype
function Game(attr, user_id){
    this.id = attr.id
    this.name = attr.name
    this.game_type = attr.game_type
    this.play_time = attr.play_time
    this.main_setup = attr.main_setup
    this.score = attr.score
    this.user_id = user_id
    this.comment = attr.comment
}

$(function(){
    Game.templateSource = $("#games-template").html();
    Game.template = Handlebars.compile(Game.templateSource);
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

Game.error = function(){
  window.location.replace("Logged_in_home")
}

Game.newGame = function(e){
  e.preventDefault()
  var action = this.action
  var params = $(this).serialize()

  $.ajax({
    url: action,
    data: params,
    dataType: "json",
    method: "POST"
    })
    .success(Game.createGame)
    .error(Game.error)
}

Game.createGame = function(json){
  var user_id = $("h1").data("user-id")
  var game = new Game(json, user_id)
  gameLI = game.renderLI()

  $("ul.games_list").append(gameLI)
}

Game.indexGame = function(json){
  var user_id = $("h1").data("user-id")
  var game = new Game(json, user_id)
  gameLI = game.renderLI()
  $("ul.games_all").append(gameLI)
}

// get the new game form
$(function(){
    $("a.js-addGame").one("click",function(e){
      e.preventDefault()
      $.get(this.href).success(Game.success)
    })
      .error(Game.error)
})

//submit the new form via json
$(function(){
  $("form#new_game").on("submit", "input.js-newGame", Game.newGame)
})

// handlebars template for index of games
$(function index(){
   $(".js-gameIndex").on("click", function(e){
     e.preventDefault()
     $(".js-gameIndex").off("click")
     $.getJSON(this.href,function(games_array){
      games_array.forEach(Game.indexGame)
    })
   })
 })

 // game details
 $(function() {
   $(document).on('click', 'a#showGame', function(e) {
     e.preventDefault()
     $.getJSON(this.href, function(game){
       console.log(game)

       $(".showHeading").html(`Full details`)
       $(".gameName").text(`Game: ${game["name"]}`)
       $(".gameType").text(`Game Type: ${game["game_type"]}`)
       $(".gameTime").text(`Game Time: ${game["play_time"]}`)
       $(".gameSetup").text(`Gear Setup: ${game["main_setup"]}`)
       $(".gameScore").text(`Ranking Score: ${game["score"]}`)
       $(".gameScore").text(`Comments: ${game["rankings"][0]["comment"]}`)

     })
   })
 })

 // grab the edit form
 $(function(){
   $(document).on("click", 'a#editGame', function(e){
     e.preventDefault()
     $.get(this.href).success(Game.success)
     .error(Game.error)
     })
   })

// submit edit form
$(function(){
  $("form").submit(function(e){
    var action = this.action
    var params = $(this).serialize()
    e.preventDefault()
      $.post(action, params, Game.success)
    })
  })
