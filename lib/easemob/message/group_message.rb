module Easemob
  class GroupMessage
    attr_reader :raw_http_response, :code, :body, :body_hash
    attr_reader :action
    attr_reader :application
    attr_reader :params
    attr_reader :uri
    attr_reader :entities
    attr_reader :data
    attr_reader :timestamp
    attr_reader :duration
    attr_reader :organization
    attr_reader :applicationName
    attr_reader :cursor
    attr_reader :count

    def initialize(http_response)
      @raw_http_response = http_response
      @code = http_response.code
      @body = http_response.body

      return if http_response.code != 200

      @body_hash = JSON.parse(http_response.body.to_s)
      @action = @body_hash['action']
      @application = @body_hash['application']
      @params = @body_hash['params']
      @uri = @body_hash['uri']
      @entities = @body_hash['entities']
      @data = @body_hash['data']
      @timestamp = @body_hash['timestamp']
      @duration = @body_hash['duration']
      @organization = @body_hash['organization']
      @applicationName = @body_hash['applicationName']
      @cursor = @body_hash['cursor']
      @count = @body_hash['count']
    end
  end
end