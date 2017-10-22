# Approach

This is a Rails 5.1.4 API-only application, using Ruby 2.4.2 and Postgres 9.6.5.

It conforms to the [json_api](http://jsonapi.org) and uses [ActiveModelSerializers](http://github.com/rails-api/active_model_serializers).

It is unit tested with RSpec 3.7, FactoryGirl, and [Shoulda::Matchers](http://github.com/thoughtbot/shoulda-matchers).

The CSV data is ingested directly from the raw URLs by the script in `db/seeds.rb`.

# Running

I'm assuming you have Ruby, Rails, and a running PostgreSQL server.

## Postgres
In order to create the Postgres user used by the app, I did this in the Postgres command-line client:
```
create role pants with createdb login password 'pants';
```

## Installing gems and creating databases
At the top level of the Rails app, you'll have to do this:
```
bundle install
rails db:create:all
RAILS_ENV=test db:migrate
```

## Ingesting CSV data

To ingest the CSV data, run the seeds file:
```
rails db:seed
```

Note that this script deletes all rows before it creates new ones, so it is idempotent.


## Running specs
To run the specs:
```
rspec -fd
```

## Running service in development

To run this service at the port expected by the [clothes](http://github.com/apoorva-muralidhara/clothes) client:

```
rails -s -p 3535
```

# Endpoint

Then the following endpoint returns a list of products with associated variants, including their inventory counts:

```
http://localhost:3535/products
```

# Improvements
* If ingesting data from the CSVs were intended to be done many times, and there was other data to be set up in `seeds.rb`, I might move the script's functionality into a custom Rake task calling a unit-tested Rake task; and make the two URLs configurable rather than hardcoded into the script.
* Since this is an API-only application, I don't see any need to namespace its routes and controllers under `api`, but if this were a real API to be used in production, I might want to namespace it under `v1` to allow for versioning.
