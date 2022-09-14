# frozen_string_literal: true

require_relative "tramway/version"
require "tramway/array"
require "tramway/routing"

module Tramway
  class Error < StandardError; end
  # Your code goes here...
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      elsif env['PATH_INFO'] == '/'
        return [ 302, {'Location' =>"http://localhost:5000/quotes/a_quote"}, [] ]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue => exception
        return [500,
                {"Content-Type" => "text/html"},
                ["500 Internal server error"]]
      end
      [200,
      {"Content-Type" => "text/html"},
      [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
