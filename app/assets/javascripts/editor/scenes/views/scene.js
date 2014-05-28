define(function(require) {

  // Imports:
  var $ = require('jquery');
  var Backbone = require('backbone');
  var ContainerView = require('containerview');
  var Utils = require('editor/common/utils');
  var Lassie = require('lassie/lassie');
  var LayoutState = require('../models/state');
  
  // Implementation:
  
  var SceneRouter = Backbone.Router.extend({
    initialize: function(options) {
      this.model = options.model;
      this.listenTo(this.model, 'change:viewState', this.push);
    },
    
    routes: {
      'layers': 'pull',
      'grids': 'pull',
      'matricies': 'pull',
      '*default': 'pull',
      '': 'pull'
    },
    
    pull: function() {
      this.model.view(Backbone.history.fragment);
    },
    
    push: function() {
      if (this.model.view() !== Backbone.history.fragment) {
        this.navigate(this.model.view());
      }
    }
  });


  // Scene Detail Navbar View
  // ----------------------------------------------------------------
  var SceneNavView = Backbone.View.extend({
    el: '#app-menu',

    initialize: function() {
      this.listenTo(this.model, 'change:viewState', this.render);
    },
    
    render: function() {
      this.$('a')
        .removeClass('active')
        .filter('[href="#'+ this.model.view() +'"]')
        .addClass('active');
    }
  });


  // Scene Layout View
  // ----------------------------------------------------------------
  var SceneView = ContainerView.extend({
    el: '#scene',
    
    initialize: function(options) {
      this.state = LayoutState.instance().reset();
      this.router = new SceneRouter({model: this.state});
      this.win = $(window).on('resize', _.debounce(_.bind(this.resize, this), 200));
      this.navbar = this.addSubview(new SceneNavView({model: this.state}));
      this.sidebar = this.createSubcontainer('#scene-sidebar');
      this.lassie = new Lassie();
      this.resize();
      
      // Create and display a new Lassie instance:
      this.lassie.loadScene(options.id);
      this.lassie.start();
      this.$('#scene-preview').append(this.lassie.view);
      
      // Create state manager model,
      // and cache references to the current data sources we're going to use:
      var scene = this.lassie.scene;
      this.state.set({
        grids: scene.grids,
        layers: scene.layers,
        matricies: scene.matricies,
        sceneId: scene.id,
        sceneModel: scene.model,
        sceneView: scene
      });
      
      // Create navbar and sidebar:
      this.listenTo(this.state, 'change:viewState', this.render);
      
      Backbone.history.start();
      this.state.view(this.state.view() || 'layers');
    },
    
    resize: function() {
      var height = this.win.height() - 52;
      var width = this.win.width() - 200;
      this.sidebar.$el.height(height);
      this.lassie.renderer.resize(width, height);
      this.state.set({
        viewWidth: width,
        viewHeight: height
      });
      
      // dispatch a single event for listeners to capture:
      this.state.trigger('resize');
    },
    
    render: function() {
      var editor = [];
      var self = this;
      
      switch (this.state.view()) {
        case 'layers': editor.push('./layers'); break;
        case 'grids': editor.push('./grids'); break;
        case 'matricies': editor.push('./matricies'); break;
      }
      
      if (editor.length) {
        require(editor, function(EditorView) {
          self.sidebar.open(new EditorView());
        });
      } else {
        this.sidebar.close();
      }
    }
  });
  
  return SceneView;
});