# README

Trail Task for Homeday

### Installation:

- clone repo `git clone git@github.com:sorefull/homeday_task.git`
- install PostgreSQL
- bundle gems
- create database `rails db:create`
- load database from dump if needed `psql -d homeday_development -f ../path/to/dump.sql`
- migrate database `rails db:migrate`
- run server

### Testing

- `rspec`

### ENV

- ruby `2.5.1`
- rails `5.2.1`
- bundler `1.16.2`
