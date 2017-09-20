# -*- encoding: utf-8 -*-
# stub: piet 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "piet"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Albert Bellonch"]
  s.date = "2017-01-30"
  s.description = "-"
  s.email = ["albert@itnig.net"]
  s.homepage = "http://itnig.net"
  s.licenses = ["MIT"]
  s.rubyforge_project = "piet"
  s.rubygems_version = "2.5.1"
  s.summary = "An image optimizer"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<png_quantizator>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<ZenTest>, [">= 0"])
      s.add_development_dependency(%q<carrierwave>, [">= 0"])
      s.add_development_dependency(%q<mini_magick>, [">= 0"])
      s.add_development_dependency(%q<rmagick>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<png_quantizator>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<ZenTest>, [">= 0"])
      s.add_dependency(%q<carrierwave>, [">= 0"])
      s.add_dependency(%q<mini_magick>, [">= 0"])
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<png_quantizator>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<ZenTest>, [">= 0"])
    s.add_dependency(%q<carrierwave>, [">= 0"])
    s.add_dependency(%q<mini_magick>, [">= 0"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
