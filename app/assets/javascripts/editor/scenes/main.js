define(function(require) {
  
  // Imports:
  var SceneView = require('./views/scene');

  // Implementation:
  var sceneId = location.href.replace(/^.+\/scenes\/(.+?)[\/\?#]*.*$/g, '$1');
  window.scene = new SceneView({id: sceneId});
});