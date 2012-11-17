require 'fixtures/fake_rails_application'

class Conference
  attr_accessor :name, :location
  extend ActiveModel::Naming
  def initialize(attrs={})
    self.attributes = attrs
  end
  def self.find(id)
    new if id
  end
  def attributes=(attributes)
    attributes.each { |k,v| send("#{k}=", v) }
  end
end

class ConferencesController < ActionController::Base
  include Rails.application.routes.url_helpers

  decorate(:conference)

  def show
    render :text => "foo"
  end

  def new
    render :text => "foo"
  end
end
