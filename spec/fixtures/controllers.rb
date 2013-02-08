class ConferencesController < ActionController::Base
  include Rails.application.routes.url_helpers

  expose_decorated(:conference)
  expose_decorated(:other_conference, model: Conference, decorator: CoolConferenceDecorator)

  def show
    render :text => "foo"
  end

  def new
    render :text => "foo"
  end
end

class AttendeesController < ActionController::Base
  include Rails.application.routes.url_helpers

  expose_decorated(:attendee)

  def show
    render :text => "foo"
  end

  def new
    render :text => "foo"
  end
end
