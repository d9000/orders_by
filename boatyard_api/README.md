# README

To test this poyect on local environment:

* Install Docker

* Create postgresql docker image: docker volume create --name boatyard-postgres

* docker-compose build

* docker-compose run boatyard rake db:setup to run migrations

* docker-compose up
