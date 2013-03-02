require 'fixtures/fake_rails_application'
require 'rspec/rails'

describe AttendeesController, type: :controller do
  before do
    get '/attendee/dave'
  end

  it "should be a decorator" do
    controller.view_context.attendee.should be_instance_of(AttendeeDecorator)
  end

  it "should be a decorator in collection" do
    controller.view_context.attendees.each do |attendee|
      attendee.should be_instance_of(AttendeeDecorator)
    end
  end
end
