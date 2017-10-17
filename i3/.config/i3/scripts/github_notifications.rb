#!/usr/bin/env ruby
require 'json'

TOKEN = File.readlines("#{ ENV['HOME'] }/.github_token").first.chomp

notifications = JSON.parse(`curl --silent -H "Authorization: token #{ TOKEN }" "https://api.github.com/notifications"`)

if notifications.any?
  puts '*GH'
else
  puts 'GH'
end
