source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'sorcery'
gem 'rails-i18n'
gem 'enum_help'
gem 'draper'
gem 'seed-fu'
gem 'ransack'
gem 'font-awesome-sass'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'dotenv-rails'
gem 'activeadmin'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem "factory_bot_rails"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
