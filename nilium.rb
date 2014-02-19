#!/usr/bin/env ruby -w

# stolen from https://gist.github.com/nilium/8949326
# assumptions:
# => single window program, always showing

require 'three.rb'

# Initialize GLFW 3.
Glfw.init

# Set window hints for GL 3.2 onward.
Glfw::Window.window_hint(Glfw::VISIBLE, GL_FALSE)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MAJOR, 3)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MINOR, 2)
Glfw::Window.window_hint(Glfw::OPENGL_FORWARD_COMPAT, GL_TRUE)
Glfw::Window.window_hint(Glfw::OPENGL_PROFILE, Glfw::OPENGL_CORE_PROFILE)


# Set a couple variables for use inside the main blocks.
#more_buffers = nil

# Create a one-field struct that holds an unsigned int. The name is that of a
# GL object.



window = Glfw::Window.new(800, 600, "Three.rb")
window.show


#close_window = lambda do window.should_close = true end
#Three.set_key_callback(window, [Glfw::KEY_ESCAPE, close_window])
window.set_key_callback do |_window, key, code, action, mods|
  _window.should_close = true if key == Glfw::KEY_ESCAPE
end

window.set_close_callback do |_window|
  _window.should_close = true
end

window.make_context_current






#vaos = $gl_uint[1]
#buffers = $gl_uint[1]

vaos = VertexArray.new
vaos.bind
#glGenVertexArrays(vaos.length, vaos.address)
#glBindVertexArray(vaos[0].name)
Three.error_check

# allocate vertices
vertex2 = Snow::CStruct.new { 
  float :x
  float :y
}
vertices = vertex2[6]

buffers = Buffer.new GL_ARRAY_BUFFER
buffers.bind
#glGenBuffers(buffers.length, buffers.address)
#glBindBuffer(GL_ARRAY_BUFFER, buffers[0].name);
glBufferData GL_ARRAY_BUFFER, vertices.bytesize, vertices.address, GL_STATIC_DRAW
Three.error_check

vertex_shader = Three.compile_shader GL_VERTEX_SHADER, "passthru.vert"
fragment_shader = Three.compile_shader GL_FRAGMENT_SHADER, "passthru.frag"
Three.error_check

program = Three.create_shader_program vertex_shader, fragment_shader
program.use
Three.error_check

#glVertexAttribPointer(index, size, type, normalized, stride, offset)
#glVertexAttribPointer( GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid * pointer);
glVertexAttribPointer 0, 5, GL_FLOAT, GL_FALSE, 0, 0
glEnableVertexAttribArray 0
Three.error_check

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
#Three.error_check

  # End cleanup block

# Explicitly destroy the window when done with it.
window.destroy
Glfw.terminate
