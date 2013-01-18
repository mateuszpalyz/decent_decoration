module DecentDecoration
  module Decorate
    def expose_decorated(name, options = {}, &block)
      options[:model] ||= name
      original_name = name.to_s
      plural_name = original_name.pluralize
      singular_name = original_name.singularize
      decorator_class = options.delete(:decorator) || "#{options[:model].to_s.classify}Decorator".constantize

      if plural_name == original_name && plural_name != singular_name && decorator_class.respond_to?(:decorate_collection)
        decorate_method = :decorate_collection
      else
        decorate_method = decorator_class.respond_to?(:decorate) ? :decorate : :new
      end

      undecorated_name = "undecorated_#{name}".to_sym
      expose(undecorated_name, options, &block)
      expose(name) { decorator_class.public_send(decorate_method, public_send(undecorated_name)) }
    end
  end
end
