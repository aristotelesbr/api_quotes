# Utils commands
run:
	@docker-compose up
kill:
	@docker-compose down
console:
	@docker-compose run --rm web bundle exec rails console
create:
	@docker-compose run --rm web bundle exec rails db:create
migrate:
	@docker-compose run --rm web bundle exec rails db:migrate
drop:
	@docker-compose run --rm web bundle exec rails db:drop
seed:
	@docker-compose run --rm web bundle exec rails db:seed
setup:
	@docker-compose run --rm web bundle exec rails db:create db:migrate db:seed
fix:
	@docker-compose run --rm web bin/rake db:migrate RAILS_ENV=development

# Test suit
test:
	@docker-compose run --rm web bundle exec rspec $(ARGS)