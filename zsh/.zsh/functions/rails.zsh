# vim:foldmethod=indent:foldlevel=0

ya() { docker_or_local "yarn $@" }

be() { docker_or_local "bundle exec $@" }
bu() { docker_or_local "bundle update $@" }
bi() { docker_or_local "bundle install $@" }

clean_devdb() { docker_or_local "bundle exec rake db:drop db:setup RAILS_ENV=development" }
clean_testdb() { docker_or_local "bundle exec rake db:drop db:setup RAILS_ENV=test" }
pclean_testdb() { docker_or_local "bundle exec rake parallel:drop[$RSPEC_CORES] parallel:setup[$RSPEC_CORES] RAILS_ENV=test" }

ber() { docker_or_local "bundle exec rails $@" }
bes() { docker_or_local "bundle exec rspec $@" }
bep() { docker_or_local "bundle exec rake parallel:spec[$RSPEC_CORES] RAILS_ENV=test" }

mi() { docker_or_local "bundle exec rake db:migrate RAILS_ENV=development" }
mit() { docker_or_local "bundle exec rake db:migrate RAILS_ENV=test" }
pmit() { docker_or_local "bundle exec rake parallel:migrate[$RSPEC_CORES]" }

rq() { docker_or_local "bundle exec rake resque:work QUEUE=*" }
rqd() { docker_or_local "bundle exec rake resque:scheduler" }

rl() { docker_or_local "bundle exec rake routes" | ag $1 }
