module DecentDecoration
  class Decoration
    attr_accessor :name, :original_options
    private :original_options

    def initialize(name, options = {})
      self.name = name
      self.original_options = options
    end

    def undecorated_name
      "undecorated_#{name}".to_sym
    end

    def options
      original_options.except(:decorator).tap do |h|
        h[:model] ||= name
      end
    end

    def decorator_class
      original_options.fetch(:decorator) { infer_decorator_class }
    end

    def decorate_method
      if plural_name? && decorator_class.respond_to?(:decorate_collection)
        :decorate_collection
      elsif decorator_class.respond_to?(:decorate)
        :decorate
      else
        :new
      end
    end

    private

    def infer_decorator_class
      "#{options[:model].to_s.classify}Decorator".constantize
    end

    def plural_name?
      plural_name == name && plural_name != singular_name
    end

    def plural_name
      name.to_s.pluralize.to_sym
    end

    def singular_name
      name.to_s.singularize.to_sym
    end
  end

  module ControllerMethods
    def expose_decorated(name, options = {}, &block)
      decoration = Decoration.new(name, options)

      decorator_class  = decoration.decorator_class
      decorate_method  = decoration.decorate_method
      undecorated_name = decoration.undecorated_name
      options          = decoration.options

      expose(undecorated_name, options, &block)
      expose(name) { decorator_class.public_send(decorate_method, public_send(undecorated_name)) }
    end
  end
end
