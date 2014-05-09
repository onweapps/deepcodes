$(document).ready(function () {

  $('#begin').click(function(event) {
    Game.init(2);
    Game.run();
  });

  $("html").keypress(function() {
    if (event.keyCode === 97) {
      Game.check_audio();
    } else if (event.keyCode === 108) {
      Game.check_visual();
    } else {
      console.log("nope");
    };
  });

  var Game = {
    init: function(n) {
      this.n = n,
      this.turns = []
    },
    run: function() {
      var progress = 99
      function repeatOften() {
        progress += 1
        if (progress % 120 === 0) {
          var randCell = Math.floor(Math.random()*9)+1;
          Game.turns.push(new Turn(randCell));
          $("#grid div").css("background-color", "#fff");
          $("#grid div").css("background-color", "#fff");
          $('#grid div:nth-child(' + randCell + ')').css({'background-color': '#7f8c8d'});
        }
        if (progress < 2400) { requestAnimationFrame(repeatOften); }
      };
      requestAnimationFrame(repeatOften);
    },
    check_visual: function() {
      if(this.turns[this.turns.length-1].visual === this.turns[this.turns.length-this.n-1].visual){
        console.log("correct")
      } else {
        console.log("incorrect")
      }
    },
    check_audio: function() {
      console.log("audio");
      // match if Game.turns.last.audio = Game.turns[n-1].audio
    }
  };

  var Turn = function(visual) {
    this.visual = visual
    //this.letter = letter
  };

});
