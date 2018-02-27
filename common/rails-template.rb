gem 'slim'
gem 'bootstrap-sass'
gem 'pry-rails'
gem 'pry-byebug'
gem 'puma'
gem 'font-awesome-sass'

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem_group :test do
  gem 'database_cleaner'
end

gem_group :development, :test do
  gem 'letter_opener'
  gem 'rspec-rails'
end

environment 'config.sass.preferred_syntax = :sass'

run 'rm README.md'
run 'rm -r test/'

after_bundle do
  file 'app/assets/stylesheets/scaffolds.sass', bootstrap
  run 'bundle exec rails generate rspec:install'

  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial Commit' }
end

def bootstrap
  <<-EOF
@import 'bootstrap-sprockets'
@import 'bootstrap'
@import 'font-awesome-sprockets'
@import 'font-awesome'
EOF
end
