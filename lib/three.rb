require 'color'
require 'glfw3'
require 'opengl-core'
require 'opengl-core/aux'
require 'snow-data'
include Gl

require 'three/glutils'
require 'three/scene'
require 'three/camera'
require 'three/renderer'
require 'three/controls'
require 'three/geometry'
require 'three/material'
require 'three/color'
require 'three/mesh'

module Three
	@@window = nil
	def self.window
		@@window
	end

	def self.setup(width: 800, height: 600, title: "Three.rb application")
		Glfw.init
		#Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MAJOR, 3)
		#Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MINOR, 2)
		#Glfw::Window.window_hint(Glfw::OPENGL_FORWARD_COMPAT, GL_TRUE)
		#Glfw::Window.window_hint(Glfw::OPENGL_PROFILE, Glfw::OPENGL_CORE_PROFILE)
		@@window = Glfw::Window.new width, height, title
		@@window.set_close_callback do |window|
			Three.close_application
		end
		@@window.make_context_current
	end

	def self.close_application
		window.should_close = true
	end

	def self.each_frame(controls=nil, &function)
		@@window.set_key_callback do |window, pressed_key, code, action, mods|
			controls.each do |expected_key, action|
				action.call if pressed_key == expected_key
			end
		end
		until @@window.should_close?
  			Glfw.poll_events # Glfw.wait_events
  			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
			function.call
  			window.swap_buffers
		end
	end
end