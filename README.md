#three.rb

## Ruby 3D library

The aim of this project is to create a lightweight 3D library with a very low level of complexity for Ruby. Not only is OpenGL a bit onerous to work with in a modern context but Ruby support is largely outdated, bloated, or esoteric.

I think that this kind of library for Ruby would go a lot further into making elegant, understandable 3D graphics code than [three.js](https://github.com/mrdoob/three.js/) does.

## Usage

As of the moment, you'll have to compile the gem manually. The file structure is still a bit messy as well.

```
git clone git@github.com:JScott/three.rb.git
cd three/gem
gem build three.rb.gemspec
gem install three-0.0.1.gem
```

See main.rb for how I'm currently using it. It's updating too quickly for me to care to paste it here right now.

## What's next?

* 0.1 => Get the base [three.js example](http://jsfiddle.net/Gy4w7/) running with three.rb
* 0.? => Start implementing useful things from the [three.js docs](http://threejs.org/docs/) and [three.js examples](http://threejs.org/) as I see fit
* 1.0 => Feature parity (or near to it) with three.js I suppose

#License

Three.rb is licensed under a simplified BSD license. I picked this license because [opengl-core](https://github.com/nilium/ruby-opengl) uses it, Noel's really smart, and I want to be smart too.

    Copyright (c) 2014, three.rb project contributors.
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this
       list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright notice,
       this list of conditions and the following disclaimer in the documentation
       and/or other materials provided with the distribution. 

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
    ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
    ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
