#!/bin/bash
gem build three.rb.gemspec
gem install three-0.0.1.gem
cd examples
ruby main.rb
