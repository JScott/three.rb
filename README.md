#three.rb

## Ruby 3D library

The aim of this project is to create a lightweight 3D library with a very low level of complexity for Ruby.

[three.js](https://github.com/mrdoob/three.js/) already shows us the immense benefit of improving the readability and portability of OpenGL. I propose that Ruby will allow for more readable code and hopefully feed back the values of [idiomatic](http://rubylove.io/howto/2013/11/23/idomatic-ruby-1/) [Ruby](http://davidraffauf.com/2013/01/30/writing-more-idiomatic-ruby-code/) into the three.js community. A win for everyone!

## Usage

As of the moment, you'll have to compile the gem manually.

```
git clone git@github.com:JScott/three.rb.git
gem build three.rb.gemspec
gem install three-0.0.1.gem
```

See examples/main.rb for how I'm currently using it. It's updating too quickly for me to care to paste it here right now.

## External docs

[Pivotal Tracker](https://www.pivotaltracker.com/s/projects/1036286)

[Relish](https://www.relishapp.com/JScott/Three-rb/docs)

## What's next?

Until 1.0.0 I'll probably just be implementing the features necessary to match the [basic github example](https://github.com/mrdoob/three.js/blob/master/README.md) and [tutorial three.js examples](http://stemkoski.github.io/Three.js/). Patch versions represent implemented examples, minor versions represent entire sections of examples, such as Sprite or Shader examples. Basic through Shader examples, inclusive, are a good candidate for 1.0.0 at which point I'll probably switch over the implementing out of the [three.js docs](http://threejs.org/docs/).

I think that this plan best represents the user needs as opposed to the needs of a graphics framework. Y'know?
