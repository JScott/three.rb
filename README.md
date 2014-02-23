#three.rb

## Ruby 3D library

The aim of this project is to create a lightweight 3D library with a very low level of complexity for Ruby.

[three.js](https://github.com/mrdoob/three.js/) already shows us the immense benefit of improving the readability and portability of OpenGL. I propose that Ruby will allow for more readable code and hopefully feed back the values of [idiomatic](http://rubylove.io/howto/2013/11/23/idomatic-ruby-1/) [Ruby](http://davidraffauf.com/2013/01/30/writing-more-idiomatic-ruby-code/) into the three.js community. A win for everyone!

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

Until 1.0.0 I'll probably just be implementing the features necessary to match the [basic github example](https://github.com/mrdoob/three.js/blob/master/README.md) and [tutorial three.js examples](http://stemkoski.github.io/Three.js/). Patch versions represent implemented examples, minor versions represent entire sections of examples, such as Sprite or Shader examples. Basic through Shader examples, inclusive, are a good candidate for 1.0.0 at which point I'll probably switch over the implementing out of the [three.js docs](http://threejs.org/docs/).

I think that this plan best represents the user needs as opposed to the needs of a graphics framework.

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
