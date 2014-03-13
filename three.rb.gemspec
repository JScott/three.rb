Gem::Specification.new do |s|
  s.name        = 'three'
  s.version     = '0.0.1'
  s.date        = '2013-02-18'
  s.summary     = "Simple, lightweight 3D"
  s.description = "Three.js but with more Ruby"
  s.authors     = ["Justin Scott"]
  s.email       = 'jvscott@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb')
  s.homepage    =
    'http://www.jvscott.net'
  s.license       = 'MIT'
	s.add_dependency 'glfw3', '~> 0.4', '>= 0.4.5'
	s.add_dependency 'opengl-core', '~> 1.3', '>= 1.3.2'
	#s.add_dependency 'opengl-core', '~> 2.0', '>= 2.0.1'
	#s.add_dependency 'opengl-aux', '~> 1.0', '>= 1.0.0.pre1'
	s.add_dependency 'snow-data', '~> 1.3', '>= 1.3.1'
  s.add_dependency 'color', '~> 1.5', '>= 1.5.1'
end
