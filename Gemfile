source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'mysql2', '0.3.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails'
gem 'erb2haml'
gem 'font-awesome-rails'
gem 'font-awesome-sass'
gem 'devise'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'fog'
gem 'jquery-rails'
gem 'jquery-turbolinks'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rspec-rails'
  gem 'factory_girl_rails', "~> 4.4.1"
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do 
  gem 'rspec'

end

group :test do 
     gem 'rspec'
     gem 'faker'
end
