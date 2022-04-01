source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'rails-i18n', '~> 5.0.0'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'kaminari'
# gem 'api-pagination'
gem 'foreman'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise_token_auth'
gem 'devise-i18n'
gem 'rspec-rails', '~> 3.5'
gem 'rack-cors'
gem 'jwt'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
