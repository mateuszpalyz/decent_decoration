module DecentDecoration
  module Decorate
    def decorate(name, options = nil, &block)
      decorator_class = "#{name.to_s.singularize.classify}Decorator".constantize
      decorated_name = name.to_sym
      undecorated_name = "undecorated_#{name}".to_sym

      expose(undecorated_name, options, &block)
      expose(decorated_name) { public_send(undecorated_name) }
    end
  end
end
