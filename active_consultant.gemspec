# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_consultant/version'

Gem::Specification.new do |spec|
  spec.name          = "active_consultant"
  spec.version       = ActiveConsultant::VERSION
  spec.authors       = ["Suman Mukherjee"]
  spec.email         = ["sumanmukherjee03@gmail.com"]
  spec.description   = %q{This gem implements an interface for easily creating consultants. Consultants are like service objects that speacialize in one task.}
  spec.summary       = %q{Easy interface for creating consultants.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
