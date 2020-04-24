# Bookstore (training App)

- Ruby 2.6.5
- Rails 6.0.2.2

## Info
Starts here: [Styling with Bootstrap Sass](https://gorails.com/episodes/7)

## How to Start

```bash
bundle install
rails db:create
rails db:migrate
rails server
```

Open in your browser [http://localhost:3000](http://localhost:3000)

### Bootstrap JS Setup

Use Yarn. In the project root:

```bash
yarn add bootstrap@3.4.1 jquery popper.js
```

Pay attention to:
- [config/webpack/environment.js](config/webpack/environment.js)
- [app/javascript/packs/application.js](app/javascript/packs/application.js)


## Checklist

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
