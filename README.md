# Rails&Vuejs

Base Rails & Vue.js project

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Running the tests](#running-the-tests)

## General info
This project is a base application made with Ruby on Rails & Vue.js.

## Technologies
The project is configured with:
* Ruby: 2.5.7
* PostgreSQL
* [@rails/webpacker](https://github.com/rails/webpacker)
* [Vue 2](https://vuejs.org/)
* [Bootstrap 4](https://getbootstrap.com.br/)
* [Tabler.io](https://tabler.io/) - template

## Setup

To run this project, install it locally:

**1. Prerequisite**

First you need to install the follow packages

```
nodejs
libpq-dev
postgresql
postgresql-contrib
imagemagick
yarn
```

Its necessary to install the Bundler and the Rails gems
```
$ gem install bundler
$ gem install rails
```

**2. Clone the project**

```
$ git clone https://github.com/renangabriel27/base-rails-vuejs.git
```

**3. Install dependencies**

```
$ bundle install
$ yarn install
```

**4. Set up PostgreSQL**

```
$ cp config/appplication.yml.example config/application.yml
```
In this file change postgres **username** and **password**
```
database: &database
	db.username: postgres
	db.password: postgres
	db.host: localhost
```

**5. Create database and tables**

```
$ rails db:create
$ rails db:migrate
```

**6. Populate the application**

```
$ rails db:populate
```

**7. Run the app**

```
$ rails s
```

and in other terminal:
```
$ yarn run webpack
```

Access the: http://localhost:3000

## Running the tests

First, create the database and tables

```
$ rails db:create RAILS_ENV=test
$ rails db:migrate RAILS_ENV=test
```

**Run rspec tests**

```
$ rspec
```

**Code quality**

Ruby code:
```
$ rubocop
```

JavaScript code:
```
$ yarn run lint
```
