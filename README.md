# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

Fork & Clone
Run `bundle install` to install dependencies
Create `config/database.yml` by copying `config/database.example.yml`
Create `config/secrets.yml` by copying `config/secrets.example.yml`
Run `bin/rake db:reset` to create, load and seed db
Create .env file based on .env.example
Sign up for a Stripe account
Put Stripe (test) keys into appropriate .env vars
Run `bin/rails s` to start the server

## Screenshots

![Product Page]()
![Admin Page]()
![Product Page View]()
![Shopping Cart]()

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt