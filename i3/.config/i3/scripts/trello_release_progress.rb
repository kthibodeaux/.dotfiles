#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-2.6.3/bin/ruby
require 'json'
require 'yaml'

RELEASE_MANAGEMENT_BOARD_ID = 'B90ZfDvh'.freeze
TRELLO = YAML.load(File.open("#{ ENV['HOME'] }/.wf.yml", 'r')).freeze
AUTH = "key=#{TRELLO['trello']['key']}&token=#{TRELLO['trello']['token']}".freeze

LIST_IDS = {
  on_deck: '58cc45de4041c3eeacedc85f',
  ready_for_testing: '5878ea48e1b7168900bfbb3a',
  testing_in_progress: '588a22d8615830d94cf7ad98',
  ready_for_release: '588a22e48e9dae28ecbc95d6',
}.freeze


cards = {}.tap do |c|
  LIST_IDS.map do |key, id|
    c[key] = JSON.parse(`curl --silent 'https://api.trello.com/1/lists/#{id}/cards?#{AUTH}'`)
  end
end

if cards.fetch(:ready_for_release).any?
  puts "Ready for Release: #{cards.fetch(:ready_for_release).first.fetch('name').partition(' ').first}"
elsif cards.fetch(:testing_in_progress).any?
  puts "In Testing: #{cards.fetch(:testing_in_progress).first.fetch('name').partition(' ').first}"
elsif cards.fetch(:ready_for_testing).any?
  puts "Ready for Testing: #{cards.fetch(:ready_for_testing).first.fetch('name').partition(' ').first}"
elsif cards.fetch(:on_deck).any?
  puts "Next: #{cards.fetch(:on_deck).first.fetch('name').partition(' ').first}"
end
