RUN_DB = docker-compose run db
RUN_WEB = docker-compose run web

default:
	@echo '** No target specified **'
	@echo 'Available targets:'
	@echo '- make build: Build the docker containers.'
	@echo '- make makemigrations: Run python manage.py makemigrations on the container.'
	@echo '- make migrate: Run python manage.py migrate on the container.'
	@echo '- make psql: Connect to the postgres database.'
	@echo '- make runserver: Runs the containers, which starts the server.'
	@echo '- make setup: Set up the quickstart project.'
	@echo '- make startapp appname={appname}: Create a new app for the django project.'
	@echo '- make stopserver: Stops the container, which stops the server.'

build:
	@docker-compose build

makemigrations:
	@${RUN_WEB} python manage.py makemigrations

migrate:
	@${RUN_WEB} python manage.py migrate

psql:
	@${RUN_DB} psql -h db -U postgres

runserver:
	@docker-compose up -d

setup:
	@docker-compose build
	@${RUN_WEB} python manage.py migrate &>/dev/null; true
	@sleep 10s
	@${RUN_WEB} python manage.py migrate

startapp:
	@${RUN_WEB} python manage.py startapp ${appname}

stopserver:
	@docker-compose stop

teardown:
	@docker ps -a -q | xargs docker stop
	@docker ps -a -q | xargs docker rm

test:
	@${RUN_WEB} python manage.py test
