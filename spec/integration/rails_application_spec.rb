require 'fixtures/fake_rails_application'
require 'rspec/rails'

describe ConferencesController, type: :controller do
  describe "inside a view" do
    it "should be a decorator" do
      get '/conference/RuPy'
      controller.view_context.conference.should be_instance_of(ConferenceDecorator)
    end

    it "should have decorated conference" do
      get '/conference/RuPy'
      controller.view_context.conference.decorated_object.should be_instance_of(Conference)
    end

    it "should be specified decorator" do
      get '/conference/RuPy'
      controller.view_context.other_conference.should be_instance_of(CoolConferenceDecorator)
    end
  end

  describe "inside a controller" do
    it "should be undecorated object" do
      get '/conference/RuPy'
      controller.conference.should be_instance_of(Conference)
    end

    it "should not be specified decorator" do
      get '/conference/RuPy'
      controller.other_conference.should be_instance_of(Conference)
    end
  end
end
