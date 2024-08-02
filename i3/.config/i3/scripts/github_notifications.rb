#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-3.3.4/bin/ruby
require 'json'

`firefox https://github.com/notifications?query=is%3Aunread` if ENV['BLOCK_BUTTON'].to_i == 1

TOKEN = File.readlines("#{ENV['HOME']}/.github_token").first.chomp

notifications = JSON.parse(`curl --silent -H "Authorization: token #{TOKEN}" "https://api.github.com/notifications"`)

puts "GH: #{notifications.size}" if notifications.any?
