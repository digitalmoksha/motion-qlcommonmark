VERSION = "1.0"

Gem::Specification.new do |spec|
  spec.name          = "motion-qlcommonmark"
  spec.version       = VERSION
  spec.authors       = ["Brett Walker"]
  spec.email         = ["brett@digitalmoksha.com"]
  spec.description   = %q{RubyMotion wrapper for the QLCommonMark QuickLook generator}
  spec.summary       = %q{RubyMotion wrapper for the QLCommonMark QuickLook generator}
  spec.homepage      = "https://github.com/digitalmoksha/motion-qlcommonmark"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
