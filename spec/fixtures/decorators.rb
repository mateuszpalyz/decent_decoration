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
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find(id)
    Attendee.find(id)
  end
end
