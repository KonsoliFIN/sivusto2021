cd drupal
drush state:set system.maintenance_mode 1 --input-format=integer
drush cache:rebuild
composer install
drush cset -y system.site uuid "<placeholder>"
drush -y entity:delete shortcut_set
drush config:import -y --source="../config/sync"
drush updatedb
drush state:set system.maintenance_mode 0 --input-format=integer
drush cache:rebuild
