module Model
  extend ActiveModel::Naming

  def initialize(attrs={})
    self.attributes = attrs
  end

  def attributes=(attributes)
    attributes.each { |k,v| send("#{k}=", v) }
  end

  def self.included(klass)
    def klass.find(id)
      new if id
    end
  end
end

class Conference
  include Model
  attr_accessor :name, :location
end

class Attendee
  include Model
  attr_accessor :first_name, :last_name
end
