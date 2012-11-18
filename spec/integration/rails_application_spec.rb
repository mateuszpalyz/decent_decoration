require 'fixtures/decorators'
require 'fixtures/controllers'
require 'rspec/rails'

describe ConferencesController, type: :controller do
  it "should be a decorator" do
    get '/conference/RuPy'
    controller.conference.should be_instance_of(ConferenceDecorator)
  end

  it "should have decorated conference" do
    get '/conference/RuPy'
    controller.conference.decorated_object.should be_instance_of(Conference)
  end
end
