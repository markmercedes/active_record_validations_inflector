
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record_validations_inflector/version"

Gem::Specification.new do |spec|
  spec.name          = "active_record_validations_inflector"
  spec.version       = ActiveRecordValidationsInflector::VERSION
  spec.authors       = ["Marcos Mercedes"]
  spec.email         = ["marcos.mercedesn@gmail.com"]

  spec.summary       = %q{Inflector for ActiveRecord validations.}
  spec.description   = %q{By inspecting columns metadata, this library generates validators on models, by default, the supported validators are presence and maximum length, but the library can be extended by the user with custom inflectable validators.}
  spec.homepage      = "https://github.com/markmercedes/active_record_validations_inflector"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activerecord', '>= 5.0.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'combustion', '>= 0.5.2', '< 0.5.5'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
