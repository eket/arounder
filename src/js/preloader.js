(function() {
  var Preloader, __;

  __ = console.log.apply(console, arguments);

  arguments[0];

  Preloader = function(game) {
    this.background = null;
    this.preloadBar = null;
    return this.ready = false;
  };

  module.exports = Preloader;

  Preloader.prototype = {
    preload: function() {
      var rot;
      rot = (function(_this) {
        return function(res, angle, period) {
          var img, tween;
          img = _this.add.image(450, 285, res);
          img.fixedToCamera = true;
          img.anchor.setTo(.5, .5);
          img.scale = {
            x: .7,
            y: .7
          };
          img.alpha = 1;
          tween = _this.add.tween(img);
          tween.to({
            angle: angle
          }, period);
          tween.onComplete.add(function() {
            img.angle = 0;
            return tween.start();
          });
          tween.start();
          return img;
        };
      })(this);
      rot('cloud', 360, 87999);
      this.load.image('end', 'assets/img/end.png');
      this.load.image('menu1', 'assets/img/menu1.png');
      this.load.image('menu2', 'assets/img/menu2.png');
      this.load.image('border', 'assets/img/border.png');
      this.load.image('cloud', 'assets/img/cloud.png');
      this.load.image('cloud2', 'assets/img/cloud2.png');
      this.load.image('cloud3', 'assets/img/cloud3.png');
      this.load.image('tileseti', 'assets/img/tileset.png');
      this.load.image('player', 'assets/img/player.png');
      this.load.image('surface', 'assets/img/surface.png');
      this.load.image('surfacew', 'assets/img/surfacew.png');
      this.load.spritesheet('tilesetgrow', 'assets/img/tilesetgrow.png', 30, 30, 20, 0, 0);
      this.load.spritesheet('tilesetdestroy', 'assets/img/tilesetdestroy.png', 30, 30, 20, 0, 0);
      this.load.spritesheet('growseed', 'assets/img/growseed.png', 30, 60, 4, 0, 0);
      this.load.spritesheet('destroyseed', 'assets/img/destroyseed.png', 30, 30, 4, 0, 0);
      this.load.spritesheet('numbers', 'assets/img/numbers.png', 60, 90, 10, 0, 0);
      this.load.audio('main', ['assets/audio/main.mp3']);
      this.load.audio('a_destroy', ['assets/audio/noise.mp3']);
      this.load.audio('a_growseed', ['assets/audio/growseed.mp3']);
      this.load.audio('a_push', ['assets/audio/push.mp3']);
      return this.load.bitmapFont('carrier_command', 'assets/fonts/carrier_command.png', 'assets/fonts/carrier_command.xml');
    },
    create: function() {},
    update: function() {
      if (true) {
        this.ready = true;
        return this.game.state.start('MainMenu');
      }
    }
  };

}).call(this);
