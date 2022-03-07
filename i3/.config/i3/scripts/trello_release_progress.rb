#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-3.1.1/bin/ruby
require 'json'
require 'yaml'

RELEASE_MANAGEMENT_BOARD_ID = 'B90ZfDvh'.freeze
DEV_BOARD_ID = 'iUU2lzsz'.freeze

TRELLO = YAML.load(File.open("#{ENV['HOME']}/.wf.yml", 'r')).freeze
AUTH = "key=#{TRELLO['trello']['key']}&token=#{TRELLO['trello']['token']}".freeze

LIST_IDS = {
  on_deck: '58cc45de4041c3eeacedc85f',
  ready_for_testing: '5878ea48e1b7168900bfbb3a',
  testing_in_progress: '588a22d8615830d94cf7ad98',
  ready_for_release: '588a22e48e9dae28ecbc95d6'
}.freeze
REJECTED_LABEL = 'Rejected'.freeze

@cards = {}.tap do |c|
  LIST_IDS.map do |key, id|
    c[key] = JSON.parse(`curl --silent 'https://api.trello.com/1/lists/#{id}/cards?#{AUTH}'`)
  end
end

def release_name_for_list(list)
  @cards.fetch(list.to_sym).first.fetch('name').partition(' ').first
end

if @cards.fetch(:testing_in_progress).any?
  release_name = release_name_for_list(:testing_in_progress)

  dev_lists = JSON.parse(`curl --silent 'https://api.trello.com/1/boards/#{DEV_BOARD_ID}/?fields=name&lists=all&list_fields=all&#{AUTH}'`)

  current_release_list_id = dev_lists
                            .fetch('lists')
                            .reject { |e| e.fetch('closed') }
                            .detect { |e| e.fetch('name').downcase == release_name.downcase }
                            .fetch('id')

  dev_list_cards = JSON.parse(`curl --silent 'https://api.trello.com/1/lists/#{current_release_list_id}/cards?#{AUTH}'`)

  rejected_stories_count = dev_list_cards.select do |card|
    labels = card.fetch('labels').map { |e| e.fetch('name') }
    labels.any? { |label| label == REJECTED_LABEL }
  end.count

  rejected_string = if rejected_stories_count.positive?
                      " (Rejected: #{rejected_stories_count})"
                    else
                      ''
                    end
  puts "In Testing: #{release_name}#{rejected_string}"
elsif @cards.fetch(:ready_for_release).any?
  puts "Ready for Release: #{release_name_for_list(:ready_for_release)}"
elsif @cards.fetch(:ready_for_testing).any?
  puts "Ready for Testing: #{release_name_for_list(:ready_for_testing)}"
elsif @cards.fetch(:on_deck).any?
  puts "Next: #{release_name_for_list(:on_deck)}"
end
