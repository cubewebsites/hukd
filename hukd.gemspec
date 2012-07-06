# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hukd/version"

Gem::Specification.new do |s|
  s.name        = "hukd"
  s.version     = Hukd::VERSION
  s.authors     = ["Cube Websites"]
  s.email       = ["messages@cubewebsites.com"]
  s.homepage    = "https://github.com/cubewebsites/hukd"
  s.summary     = "API Wrapper for HotUKDeals (HUKD)"
  s.description = "API Wrapper for HotUKDeals (HUKD)"

  s.rubyforge_project = "hukd"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.6"
	s.add_runtime_dependency "httparty"
end
