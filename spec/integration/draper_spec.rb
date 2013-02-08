require 'fixtures/fake_rails_application'
require 'rspec/rails'

describe AttendeesController, type: :controller do
  it "should be a decorator" do
    get '/attendee/dave'
    controller.attendee.should be_instance_of(AttendeeDecorator)
  end
end
