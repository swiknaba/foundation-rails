# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundation/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "foundation-rails"
  spec.version       = Foundation::Rails::VERSION
  spec.authors       = ["Yetinauts"]
  spec.email         = ["contact@get.foundation"]
  spec.description   = %q{Foundation on Sass/Compass}
  spec.summary       = %q{Foundation on Sass/Compass}
  spec.homepage      = "https://get.foundation"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sass", [">= 3.3.0"]
  spec.add_dependency "railties", [">= 6.0.0"]
  spec.add_dependency "sprockets-es6", [">= 0.9.0"]

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  # Required by dummy app
  spec.add_development_dependency "bootsnap"
  spec.add_development_dependency "listen"
end
