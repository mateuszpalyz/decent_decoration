require 'active_support/all'

require 'decent_exposure'
require 'decent_decoration'

require 'action_controller'
require 'action_dispatch'
require 'active_model'

module Rails
  class App
    def env_config; {} end
    def routes
      return @routes if defined?(@routes)
      @routes = ActionDispatch::Routing::RouteSet.new
      @routes.draw do
        get '/conferences/new' => "conferences#new"
        get '/conference/(:id)' => "conferences#show"
        get '/attendees/new' => "attendees#new"
        get '/attendee/(:id)' => "attendees#show"
      end
      @routes
    end
    def call(*args)
      routes.call(*args)
    end
  end
  def self.application
    @app ||= App.new
  end
end

require 'fixtures/models'
require 'fixtures/decorators'
require 'fixtures/controllers'
