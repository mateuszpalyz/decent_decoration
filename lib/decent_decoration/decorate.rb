module DecentDecoration
  module Decorate
    def expose_decorated(name, options = {}, &block)
      decorator_class = "#{name.to_s.singularize.classify}Decorator".constantize
      decorated_name = name.to_sym
      undecorated_name = "undecorated_#{name}".to_sym

      options[:model] ||= decorated_name
      decorate_method = decorator_class.respond_to?(:decorate) ? :decorate : :new
      expose(undecorated_name, options, &block)
      expose(decorated_name) { decorator_class.public_send(decorate_method, public_send(undecorated_name)) }
    end
  end
end
