# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'inkling/version'

Gem::Specification.new do |s|
  s.name = %q{inkling}
  s.version = Inkling::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicholas Faiz", "Clifford Heath"]
  s.email       = ["nicholas@treefallinginthewoods.com"]
  s.homepage    = "http://github.com/tfw/inkling"
  s.summary     = "A Knowledge Management Engine for Rails 3"
  s.description = "A Knowledge Management Engine for Rails 3"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency('ratom')
  s.add_dependency('pg')

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*") 
  # s.executables  = ['bundle']
  s.require_path = 'lib'
end
