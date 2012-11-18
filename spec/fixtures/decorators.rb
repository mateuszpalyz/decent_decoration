require 'delegate'

class ConferenceDecorator < SimpleDelegator
  def decorated_object
    __getobj__
  end
end
