run_test:
	bundle exec rake test
run_migration:
	cd test/dummy; rails db:migrate:reset
run_build:
	bundle install;