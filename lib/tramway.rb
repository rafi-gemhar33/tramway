# frozen_string_literal: true

require_relative "tramway/version"

module Tramway
  class Error < StandardError; end
  # Your code goes here...
  class Application
    def call(env)
      [200,
      {"Content-Type" => "text/html"},
      ["Hello, world from tramway!!!"]]
    end
  end
end
