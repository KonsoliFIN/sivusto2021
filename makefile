EXEC = docker-compose exec web

build:
	git pull
	docker-compose up -d
	$(EXEC) composer install

install:
	$(EXEC) ./vendor/bin/run drupal:site-install
	$(EXEC) drush cache:rebuild

pack:
	$(EXEC) drush config:export --destination="../config/sync"

unpack:
	$(EXEC) drush cset -y system.site uuid "f1dccf57-bc06-4b18-a668-b29249ab330b"
	$(EXEC) drush -y entity:delete shortcut_set
	$(EXEC) drush config:import --source="../config/sync"

start:
	docker-compose up -d

stop:
	docker-compose stop

update:
	$(EXEC) drush state:set system.maintenance_mode 1 --input-format=integer
	$(EXEC) drush cache:rebuild
	git pull
	$(EXEC) composer update
	$(EXEC) drush updatedb
	$(EXEC) drush state:set system.maintenance_mode 0 --input-format=integer
	$(EXEC) drush cache:rebuild
