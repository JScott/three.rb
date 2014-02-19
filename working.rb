#!/usr/bin/env ruby -w

# stolen from https://gist.github.com/nilium/8949326
# assumptions:
# => single window program, always showing

# This list of requires makes me feel like I'm shilling for some reason.
#require 'glfw3'         # https://github.com/nilium/ruby-glfw3/
#require 'opengl-core'   # https://github.com/nilium/ruby-opengl/
#require 'snow-data'     # https://github.com/nilium/ruby-snowdata/
require 'three.rb'

# It's a pain in the neck typing Gl:: over and over. Don't question this.
#include Gl


#
# Creates a GLFW window and yields it and any additional unrecognized arguments
# to the block. The window is closed and destroyed once the block exits.
#
def with_context(width, height, title, *args, **hash_args, &block)
  window = Glfw::Window.new(width, height, title)
  window.show
  window.make_context_current
  block.call(window, *args, **hash_args).tap do
    puts "shutting down context"
    Glfw::Window.unset_context
    window.hide
    window.destroy
  end
end




#
# Creates a main window and loops inside of it, polling for events if realtime
# is true, otherwise waiting for events. If an init: lambda/proc is provided,
# it will be called before entering the main loop.
#
def main_window(width, height, *args, init: nil, realtime: false, **kvargs, &block)
  with_context(width, height, "Main") do |window|
    puts "with_context"
    # Initialize context
    init.call unless init.nil?

    # Main loop
    until window.should_close?
      if realtime then Glfw.poll_events else Glfw.wait_events end
      block.call(*args, **kvargs) unless block.nil?
    end

    window.close_callback = nil
  end
end



# Create a one-field struct that holds an unsigned int. The name is that of a
# GL object.
GLObject = Snow::CStruct.new { uint32_t :name }


# Initialize GLFW 3.
Glfw.init

# Set window hints for GL 3.2 onward.
Glfw::Window.window_hint(Glfw::VISIBLE, GL_FALSE)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MAJOR, 3)
Glfw::Window.window_hint(Glfw::CONTEXT_VERSION_MINOR, 2)
Glfw::Window.window_hint(Glfw::OPENGL_FORWARD_COMPAT, GL_TRUE)
Glfw::Window.window_hint(Glfw::OPENGL_PROFILE, Glfw::OPENGL_CORE_PROFILE)


# Set a couple variables for use inside the main blocks.
buffers = []
more_buffers = nil

context_init = lambda do
  # Allocate an array of four contiguous (in memory) GLObject structures.
  more_buffers = GLObject[4]
  glGenBuffers(more_buffers.length, more_buffers.address)
  Three.error_check

  # Log the names for each
  more_buffers.each do |buf|
    puts "#{buf.name} <-- using Snow::CStruct"
  end
end

context_cleanup = lambda do
  # Dispose of the buffer objects in the buffers array.
  GLObject[buffers.length].tap do |ary|
    buffers.each_with_index { |buf, idx| ary[idx].name = buf }
    glDeleteBuffers(ary.length, ary.address)
  end.free!
  Three.error_check

  # Dispose of the buffer objects in the more_buffers array. This particular
  # call only looks simpler because I didn't have to create a memory block to
  # dispose of the buffer objects like I did with the other array. In practice,
  # they're the same thing, just one had its memory allocated immediately.
  glDeleteBuffers(more_buffers.length, more_buffers.address)
  more_buffers.free!
  more_buffers = nil
  Three.error_check

  # End cleanup block
end

main_window(800, 600, init: context_init, done: context_cleanup) do

  #############################################################################
  #  FRAME LOOP BODY                                                          #
  #############################################################################

  # Nothing to see here
  puts "looping"

  # End frame loop body
end

# Kill GLFW 3
Glfw.terminate
