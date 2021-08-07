require_relative "lib/activerecord_converter/version"

Gem::Specification.new do |spec|
  spec.name        = "activerecord_converter"
  spec.version     = ActiverecordConverter::VERSION
  spec.authors     = ["Kashiwara"]
  spec.email       = ["tamatebako0205@gmail.com"]
  spec.homepage    = "https://github.com/Kashiwara0205/activerecord_converter"
  spec.summary     = "convert activerecord to just ary hash"
  spec.description = "convert activerecord to just ary hash"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0.0"
end
