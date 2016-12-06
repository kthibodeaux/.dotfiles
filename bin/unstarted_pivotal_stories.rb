require 'json'

raw_data = `curl --silent -X GET -H "X-TrackerToken: #{ ENV['PIVOTAL_TOKEN'] }" "https://www.pivotaltracker.com/services/v5/projects/#{ ENV['PIVOTAL_PROJECT_ID'] }/stories?filter=state%3Aunstarted"`

puts JSON.parse(raw_data)
  .reject { |story| story['story_type'] == 'release' }
  .map { |story| "#{ story['id'] } #{ story['story_type'].upcase }: #{ story['name'] }" }
