#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-3.1.1/bin/ruby
require 'json'

TOKEN = File.readlines("#{ENV['HOME']}/.github_token").first.chomp

notifications = JSON.parse(`curl --silent -H "Authorization: token #{TOKEN}" "https://api.github.com/notifications"`)

puts "GH: #{notifications.size}" if notifications.any?
