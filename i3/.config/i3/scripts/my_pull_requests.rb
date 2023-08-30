#!/usr/bin/env /home/kthibodeaux/.rubies/ruby-3.1.1/bin/ruby
require 'json'

TOKEN = File.readlines("#{ENV['HOME']}/.github_token").first.chomp

class PullRequests
  REVIEWED_LABEL = 'Changes Requested'
  AWAITING_RESPONSE_LABEL = 'Awaiting Response'
  GITHUB_USERNAME = 'kthibodeaux'
  REPO = 'BaldwinAviation/baldwin-web'

  def self.process
    new.process
  end

  def process
    return unless needs_attention_count > 0

    puts "My PRs: #{needs_attention_count}"
  end

  private

  def needs_attention_count
    my_reviewed_pull_requests.size
  end

  def my_reviewed_pull_requests
    my_pull_requests.select { |pr| pr.labels.include?(REVIEWED_LABEL) } +
      my_pull_requests.select { |pr| pr.labels.include?(AWAITING_RESPONSE_LABEL) }
  end

  def my_pull_requests
    pull_requests.select { |pr| pr.creator == GITHUB_USERNAME }
  end

  def pull_requests
    @pull_requests ||= JSON.parse(`curl --silent -H "Authorization: token #{TOKEN}" -H "Content-Type: application/json" "https://api.github.com/repos/#{REPO}/issues"`)
                           .select do |e|
                         e.has_key?('pull_request')
                       end
                           .map do |e|
      PullRequest.new(e)
    end
  end

  class PullRequest
    attr_reader :labels

    def initialize(json_data)
      @json_data = json_data
    end

    def creator
      json_data.fetch('user').fetch('login')
    end

    def labels
      @labels ||= json_data.fetch('labels').map { |e| e.fetch('name') }
    end

    private

    attr_reader :json_data
  end
end

PullRequests.process
