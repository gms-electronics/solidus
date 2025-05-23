# frozen_string_literal: true

require_relative '../core/lib/spree/core/version.rb'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_api"
  s.version     = Spree.solidus_version
  s.summary     = 'REST API for the Solidus e-commerce framework.'
  s.description = s.summary

  s.author      = 'Solidus Team'
  s.email       = 'contact@solidus.io'
  s.homepage    = 'http://solidus.io'
  s.license     = 'BSD-3-Clause'

  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec|bin)/})
  end

  s.required_ruby_version = '>= 3.1.0'
  s.required_rubygems_version = '>= 1.8.23'

  s.add_dependency 'jbuilder', '~> 2.8'
  s.add_dependency 'kaminari-activerecord', '~> 1.1'
  s.add_dependency 'responders'
  s.add_dependency 'solidus_core', s.version
end
