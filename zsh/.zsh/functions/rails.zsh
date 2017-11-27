# vim:foldmethod=indent:foldlevel=0

docker_or_local() {
  if [[ -f docker-compose.yml ]]; then
    eval {"docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true web $@"}
  else
    eval {"SKIP_SIMPLECOV=true $@"}
  fi
}

docker_or_local_dev() {
  if [[ -f docker-compose.yml ]]; then
    eval {"docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true -e RAILS_ENV=development web $@"}
  else
    eval {"SKIP_SIMPLECOV=true RAILS_ENV=development $@"}
  fi
}

docker_or_local_test() {
  if [[ -f docker-compose.yml ]]; then
    eval {"docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true -e RAILS_ENV=test web $@"}
  else
    eval {"SKIP_SIMPLECOV=true RAILS_ENV=test $@"}
  fi
}

be() { docker_or_local "bundle exec $@" }
bu() { docker_or_local "bundle update $@" }
bi() { docker_or_local "bundle install $@" }

clean_devdb() { docker_or_local_dev "bundle exec rake db:drop db:setup" }
clean_testdb() { docker_or_local_test "bundle exec rake db:drop db:setup" }
pclean_testdb() { docker_or_local_test "bundle exec rake parallel:drop[8] parallel:setup[8]" }

ber() { docker_or_local "bundle exec rails $@" }
bes() { docker_or_local "bundle exec rspec $@" }
bep() { docker_or_local "bundle exec rake parallel:spec[8]" }

mi() { docker_or_local_dev "bundle exec rake db:migrate" }
mit() { docker_or_local_test "bundle exec rake db:migrate" }
pmit() { docker_or_local "bundle exec rake parallel:migrate[8]" }
