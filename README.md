# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product Screenshots

!["Screenshot of Jungle Main Page"](https://github.com/wangxx1412/jungle-rails/blob/master/docs/main.png?raw=true)
!["Screenshot of Product Detail Page"](https://github.com/wangxx1412/jungle-rails/blob/master/docs/detail.png?raw=true)
!["Screenshot of Cart Page"](https://github.com/wangxx1412/jungle-rails/blob/master/docs/cart.png?raw=true)
!["Screenshot of Admin products Page"](https://github.com/wangxx1412/jungle-rails/blob/master/docs/adminproducts.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Testing

Run `bin/rspec` to test the code
Run `bin/rspec spec/features` specifically capybara test

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Functionalities

- User can signup and login the app
- User can add products to the cart
- User can create orders by checkout (using testing stripe credit card)
- User can check details of a certain product
- User can logout
- Admins can add/remove product
- Admins can add categories
