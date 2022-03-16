# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "olibrary/version"

Gem::Specification.new do |s|
  s.name = "olibrary"
  s.version = Olibrary::VERSION
  s.authors = ["Yosef Serkez"]
  s.email = ["yosefserkez@gmail.com"]
  s.homepage = "https://github.com/4till2/olibrary"
  s.summary = %q{Ruby Interface for the openlibrary.org API}
  s.description = %q{openlibrary.org API Interface}

  s.rubyforge_project = "olibrary"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~> 3.11.0'
  s.add_development_dependency 'webmock', '~> 3.14.0'

  s.add_runtime_dependency 'hashie', '~> 5.0.0'
  s.add_runtime_dependency 'json', '>= 2.6.1'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0'

  s.add_runtime_dependency 'activesupport', '~> 7.0.2.3'
end
