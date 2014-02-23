require 'three'

Three::setup 800, 600, "Three.rb test"

@camera = Three::PerspectiveCamera.new 75, 1, 10000
#camera.position.z = 1000

@scene = Three::Scene.new

#geometry = Three::BoxGeometry.new 200, 200, 200
#material = Three::MeshBasicMaterial.new { color: 0xff0000, wireframe: true }

#mesh = Three.Mesh.new geometry, material
#scene.add mesh

@renderer = Three::Renderer.new

@controls = Three::Controls.new
@controls.for Glfw::KEY_ESCAPE do Three.close_application end

Three::each_frame @controls do
   #requestAnimationFrame( animate )
   #mesh.rotation.x += 0.01
   #mesh.rotation.y += 0.02
   #renderer.render scene, camera
   @renderer.render @scene, @camera
end