# frozen_string_literal: true

require_relative "tramway/version"

require "tramway/array"

module Tramway
  class Error < StandardError; end
  # Your code goes here...
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200,
      {"Content-Type" => "text/html"},
      ["Hello, world from tramway!!!"]]
    end
  end
end
