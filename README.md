# Jungle Project

Jungle is a full stack web application built with Ruby, rails, PostgreSQL that allows users to register for an account, order items, and even rating the items and comment about them.

## Final product

![This is the home page](https://github.com/rickysychan/jungle-rails/blob/master/docs/Home%20page.png)
![Registration page](https://github.com/rickysychan/jungle-rails/blob/master/docs/Sign%20up%20page.png)
![Product page](https://github.com/rickysychan/jungle-rails/blob/master/docs/Product%20page.png)

## Dependencies
- gem 'rails', '4.2.6'
- gem 'pg'
- gem 'sass-rails', '~> 5.0'
- gem 'uglifier', '>= 1.3.0'
- gem 'jquery-rails'
- gem 'jbuilder', '~> 2.0'
- gem 'sdoc', '~> 0.4.0', group: :doc
- gem 'bcrypt', '~> 3.1.7'
- gem 'puma'
- gem 'bootstrap-sass', '~> 3.3.6'
- gem 'font-awesome-rails'
- gem 'money-rails'
- gem 'carrierwave'
- gem 'rmagick'
- gem 'stripe'
- gem 'faker'


group :development, :test do

 - gem 'byebug'
 - gem 'quiet_assets'
 - gem 'dotenv-rails'
 - gem 'pry'
end

group :development do
  - gem 'web-console', '~> 2.0'
  - gem 'spring'

## Getting started

- Run bundle install to install dependencies
- Create config/database.yml by copying config/database.example.yml
- Create config/secrets.yml by copying config/secrets.example.yml
- Run bin/rake db:reset to create, load and seed db
- Create .env file based on .env.example
- Sign up for a Stripe account
- Put Stripe (test) keys into appropriate .env vars
- Run bin/rails s -b 0.0.0.0 to start the server
