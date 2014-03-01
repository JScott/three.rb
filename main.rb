require 'three'

Three::setup 800, 600, "Three.rb test"

@camera = Three::PerspectiveCamera.new 75, 1, 10000
@camera.position.z = 1000

@scene = Three::Scene.new

#geometry = Three::BoxGeometry.new 200, 200, 200
geometry = Three::Geometry.new
vertices = Three::Vector3[3]
vertices[0].x, vertices[0].y, vertices[0].z = -0.90, -0.90, 1.0
vertices[1].x, vertices[1].y, vertices[0].z = 0.85, -0.90, 1.0
vertices[2].x, vertices[2].y, vertices[0].z = -0.90, 0.85, 1.0
geometry.push vertices
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