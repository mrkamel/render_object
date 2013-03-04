# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "render_object/version"

Gem::Specification.new do |s|
  s.name        = "render_object"
  s.version     = RenderObject::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = ""
  s.summary     = %q{Map an object to a partial}
  s.description = %q{Map an object to a partial and render it}

  s.rubyforge_project = "render_object"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 2.3"

  s.add_development_dependency "rake"
end
