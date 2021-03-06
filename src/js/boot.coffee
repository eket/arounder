Boot = (game) ->

module.exports = Boot;

Boot.prototype =

  preload: () ->
    # Here we load the assets required for our preloader (in this case a background and a loading bar)
    #this.load.image('preloaderBackground', 'assets/img/preloader_background.jpg');
    #this.load.image('preloaderBar', 'assets/img/preloader_bar.png');
    #this.load.image('menusharp', 'assets/img/menusharp.png');
    @load.image('cloud', 'assets/img/cloud.png');
  

  create: ()  -> 


    # Unless you specifically know your game needs to support multi-touch I would recommend setting this to 1
    this.game.input.maxPointers = 1;

    # Phaser will automatically pause if the browser tab the game is in loses focus. You can disable that here:
    this.game.stage.disableVisibilityChange = true;

    if (this.game.device.desktop) 
      # If you have any desktop specific settings, they can go in here
      this.game.stage.scale.pageAlignHorizontally = true;
    else
      # Same goes for mobile settings.
      # In this case we're saying "scale the game, no lower than 480x260 and no higher than 1024x768"
      this.game.stage.scaleMode = Phaser.StageScaleMode.SHOW_ALL;
      this.game.stage.scale.minWidth = 900;
      this.game.stage.scale.minHeight = 570;
      this.game.stage.scale.maxWidth = 900;
      this.game.stage.scale.maxHeight = 570;
      this.game.stage.scale.forceLandscape = true;
      this.game.stage.scale.pageAlignHorizontally = true;
      this.game.stage.scale.setScreenSize(true);
    

    # By this point the preloader assets have loaded to the cache, we've set the game settings
    # So now let's start the real preloader going
    this.game.state.start('Splash');
  


