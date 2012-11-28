module DecentDecoration
  module Decorate
    def expose_decorated(name, options = {}, &block)
      decorator_class = "#{name.to_s.singularize.classify}Decorator".constantize
      decorated_name = name.to_sym
      undecorated_name = "undecorated_#{name}".to_sym

      options[:model] ||= decorated_name
      expose(undecorated_name, options, &block)
      expose(decorated_name) { decorator_class.new(public_send(undecorated_name)) }
    end
  end
end
