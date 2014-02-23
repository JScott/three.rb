#!/usr/bin/env ruby -w

# stolen from https://gist.github.com/nilium/8949326
# assumptions:
# => single window program, always showing

require 'three.rb'

# Three.rb doesn't cover controls and window handling. We leave that to Glfw
Glfw.init
#Glfw::Window.window_hint(Glfw::VISIBLE, GL_FALSE)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MAJOR, 3)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MINOR, 2)
Glfw::Window.window_hint(Glfw::OPENGL_FORWARD_COMPAT, GL_TRUE)
Glfw::Window.window_hint(Glfw::OPENGL_PROFILE, Glfw::OPENGL_CORE_PROFILE)
window = Glfw::Window.new(800, 600, "Three.rb")
window.show

# Set a couple variables for use inside the main blocks.
#more_buffers = nil

# Create a one-field struct that holds an unsigned int. The name is that of a
# GL object.






#close_window = lambda do window.should_close = true end
#Three.set_key_callback(window, [Glfw::KEY_ESCAPE, close_window])
window.set_key_callback do |_window, key, code, action, mods|
  _window.should_close = true if key == Glfw::KEY_ESCAPE
end

window.set_close_callback do |_window|
  _window.should_close = true
end

window.make_context_current








vaos = VertexArray.new
vaos.bind
Three::GLUtils.error_check

# allocate vertices
vertex2 = Snow::CStruct.new { 
  float :x
  float :y
}
vertices = vertex2[6]
vertices[0].x, vertices[0].y = -0.90, -0.90
vertices[1].x, vertices[1].y = 0.85, -0.90
vertices[2].x, vertices[2].y = -0.90, 0.85
vertices[3].x, vertices[3].y = 0.90, -0.85
vertices[4].x, vertices[4].y = 0.90, 0.90
vertices[5].x, vertices[5].y = -0.85, 0.90

buffers = Buffer.new GL_ARRAY_BUFFER
buffers.bind
glBufferData GL_ARRAY_BUFFER, vertices.bytesize, vertices.address, GL_STATIC_DRAW
Three::GLUtils.error_check

vertex_shader = Three::GLUtils.compile_shader GL_VERTEX_SHADER, "passthru.vert"
fragment_shader = Three::GLUtils.compile_shader GL_FRAGMENT_SHADER, "passthru.frag"
Three::GLUtils.error_check

program = Three::GLUtils.create_shader_program vertex_shader, fragment_shader
program.use
Three::GLUtils.error_check

#glVertexAttribPointer(index, size, type, normalized, stride, offset)
#glVertexAttribPointer( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid * pointer);
glVertexAttribPointer 0, 2, GL_FLOAT, GL_FALSE, 0, 0
glEnableVertexAttribArray 0
Three::GLUtils.error_check

until window.should_close?
  # And do stuff
  Glfw.wait_events
  puts "looping"
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
  vaos.bind
  glDrawArrays GL_TRIANGLES, 0, 6

  window.swap_buffers
end




#
# Here's where I'd clean up if I cared.
#

# Dispose of the buffer objects in the more_buffers array
#glDeleteVertexArrays()
#glDeleteBuffers(buffers.length, buffers.address)
#VAOs.free!

#more_buffers = nil
#Three::GLUtils.error_check

  # End cleanup block

# Explicitly destroy the window when done with it.
window.destroy
Glfw.terminate
