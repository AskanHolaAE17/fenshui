source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby '2.3.3'
# Rails 5.0.3

gem 'rails', '~> 5.0.2'
gem 'haml'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'execjs'
gem 'jquery-rails'
gem 'bootstrap'


# For using ActiveAdmin:
gem 'inherited_resources', '~> 1.7'
gem 'activeadmin', github: 'activeadmin'
gem 'country_select', github: 'stefanpenner/country_select'

##gem 'liqpay', github: 'liqpay/sdk-ruby'
gem 'devise'
gem 'mail'

gem 'passenger'
gem 'heroku'
gem 'puma-heroku'

gem 'figaro'
gem 'rsa'
gem 'utf8-cleaner'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'puma', '~> 3.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data'
gem 'jbuilder', '~> 2.5'
gem 'rails_12factor'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'  
end

group :production do
  gem 'pg'
  gem 'heroku-deflater'  
  gem 'json'
  # gem 'json', '~> 1.8', '>= 1.8.3'    
end


