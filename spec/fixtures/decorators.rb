require 'delegate'
require 'draper'

class ConferenceDecorator < SimpleDelegator
  def decorated_object
    __getobj__
  end
end

class CoolConferenceDecorator < ConferenceDecorator
end

class AttendeeDecorator < Draper::Decorator
  decorates :attendee
  def full_name
    "#{first_name} #{last_name}"
  end
end
