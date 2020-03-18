#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-2.6.3/bin/ruby
require 'json'
require 'yaml'

DEV_BOARD_ID = 'iUU2lzsz'.freeze
TRELLO = YAML.load(File.open("#{ ENV['HOME'] }/.wf.yml", 'r')).freeze
AUTH = "key=#{TRELLO['trello']['key']}&token=#{TRELLO['trello']['token']}".freeze
READY_LABELS = [
  'Accepted',
  'Fixed in Production',
  'Hotfixed',
  'No Testing Required',
].freeze

all_lists = JSON.parse(`curl --silent 'https://api.trello.com/1/boards/#{DEV_BOARD_ID}/?fields=name&lists=all&list_fields=all&#{AUTH}'`)
active_lists = all_lists.fetch('lists').reject { |e| e.fetch('closed') }

current_release_list_position = active_lists.map { |e| e.fetch('name') }.index('Pull Request') + 1
current_release_list_id = active_lists[current_release_list_position].fetch('id')
current_release_list_name = active_lists[current_release_list_position].fetch('name')

cards = JSON.parse(`curl --silent 'https://api.trello.com/1/lists/#{current_release_list_id}/cards?#{AUTH}'`)

ready_cards = cards.select do |card|
  labels = card.fetch('labels').map { |e| e.fetch('name') }
  labels.any? { |label| READY_LABELS.include?(label) }
end

puts "#{current_release_list_name}: #{ready_cards.size}/#{cards.size}"
