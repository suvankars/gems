Gem::Specification.new do |spec|
    spec.name          = "roman-numeral"
    spec.version       = "0.0.1"
    spec.authors       = ["Suvankar Satpati"]
    spec.email         = ["suvankar.17@gmail.com"]
    spec.description   = %q{Roman numeral converter}
    spec.summary       = %q{Convert roman numeral to decimal and viceversa}
    spec.homepage      = "https://github.com/suvankars/gems/tree/master/roman_numerals" 
    spec.license       = "MIT"

    spec.files         = `git ls-files`.split($/)
    spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 1.3.5"
    spec.add_development_dependency "rspec"
    spec.add_development_dependency "rake"
end
