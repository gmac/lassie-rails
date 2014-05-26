define(function(require) {
  var SceneView = require('./views/scene');
  var sceneId = location.href.split('/').pop();
  var scene = new SceneView({id: sceneId});
});