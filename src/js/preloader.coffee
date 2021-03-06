__ = console.log arguments...; arguments[0]

Preloader = (game) ->
  this.background = null;
  this.preloadBar = null;
  this.ready = false;


module.exports = Preloader;

Preloader.prototype =

  preload: () ->
    #// These are the assets we loaded in Boot.js
    #// A nice sparkly background and a loading progress bar
    #@background = this.add.sprite(0, 0, 'preloaderBackground');
    #@preloadBar = this.add.sprite(300, 400, 'preloaderBar');

    #//  This sets the preloadBar sprite as a loader sprite.
    #//  What that does is automatically crop the sprite from 0 to full-width
    #//  as the files below are loaded in.
    #@load.setPreloadSprite(this.preloadBar);
    rot = (res, angle, period) =>
      img = @add.image 450, 285, res
      img.fixedToCamera = yes
      img.anchor.setTo .5, .5
      img.scale = {x: .7, y: .7}
      img.alpha = 1 #0.8
      tween = @add.tween img
      tween.to (angle: angle), period
      tween.onComplete.add => img.angle = 0; tween.start()
      tween.start()
      img


    rot 'cloud',360, 87999
    #//  Here we load the rest of the assets our game needs.
    #//  As this is just a Project Template I've not provided these assets, swap them for your own.
    @load.image('end', 'assets/img/end.png');
    @load.image('menu1', 'assets/img/menu1.png');
    @load.image('menu2', 'assets/img/menu2.png');
    #load.atlas('playButton', 'assets/img/play_button.png', 'assets/img/play_button.json');
    @load.image('border', 'assets/img/border.png');
    @load.image('cloud', 'assets/img/cloud.png');
    @load.image('cloud2', 'assets/img/cloud2.png');
    @load.image('cloud3', 'assets/img/cloud3.png');
    #@load.image('backpixel', 'assets/img/backpixel.png');
    @load.image('tileseti', 'assets/img/tileset.png');
    @load.image('player', 'assets/img/player.png');
    @load.image('surface', 'assets/img/surface.png');
    @load.image('surfacew', 'assets/img/surfacew.png');
    @load.spritesheet('tilesetgrow', 'assets/img/tilesetgrow.png', 30, 30, 20, 0, 0);
    @load.spritesheet('tilesetdestroy', 'assets/img/tilesetdestroy.png', 30, 30, 20, 0, 0);
    @load.spritesheet('growseed', 'assets/img/growseed.png', 30, 60, 4, 0, 0)
    @load.spritesheet('destroyseed', 'assets/img/destroyseed.png', 30, 30, 4, 0, 0)
    @load.spritesheet('numbers', 'assets/img/numbers.png', 60, 90, 10, 0, 0)
    #@load.image('playButton', 'assets/img/button_sprite_sheet.png', 193, 71);
    @load.audio('main', ['assets/audio/main.mp3']);
    @load.audio('a_destroy', [ 'assets/audio/noise.mp3'])
    @load.audio('a_growseed', [ 'assets/audio/growseed.mp3'])
    @load.audio('a_push', [ 'assets/audio/push.mp3'])

    @load.bitmapFont('carrier_command', 'assets/fonts/carrier_command.png', 'assets/fonts/carrier_command.xml');
  

  create: () ->
    #//  Once the load has finished we disable the crop because we're going to sit in the update loop for a short while as the music decodes
    #this.preloadBar.cropEnabled = false;



  update: () ->
    #//  You don't actually need to do this, but I find it gives a much smoother game experience.
    #//  Basically it will wait for our audio file to be decoded before proceeding to the MainMenu.
    #//  You can jump right into the menu if you want and still play the music, but you'll have a few
    #//  seconds of delay while the mp3 decodes - so if you need your music to be in-sync with your menu
    #//  it's best to wait for it to decode here first, then carry on.

    #//  If you don't have any music in your game then put the game.state.start line into the create function and delete
    #//  the update function completely.

    #if (this.cache.isSoundDecoded('titleMusic') && this.ready is false)
    if true
      this.ready = true;
      this.game.state.start('MainMenu');
    
  
