require 'three'

#init();
#animate();

def animate
    #requestAnimationFrame( animate );
    #mesh.rotation.x += 0.01;
    #mesh.rotation.y += 0.02;
    #renderer.render scene, camera ;
end

width = 10 #window.innerWidth
height = 10 #window.innerHeight
camera = Three::PerspectiveCamera.new 75, width / height, 1, 10000
#camera.position.z = 1000

scene = Three::Scene.new

#geometry = Three::BoxGeometry.new 200, 200, 200
#material = Three::MeshBasicMaterial.new { color: 0xff0000, wireframe: true }

#mesh = Three.Mesh.new geometry, material
#scene.add mesh

renderer = Three::Renderer.new
#renderer.setSize window.innerWidth, window.innerHeight
