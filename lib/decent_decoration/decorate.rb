module DecentDecoration
  class Decoration
    attr_accessor :name, :original_options
    private :original_options

    def initialize(name, options = {})
      self.name = name
      self.original_options = options
    end

    def decorated_name
      "decorated_#{name}".to_sym
    end

    def options
      original_options.except(:decorator, :collection).tap do |h|
        h[:model] ||= name
      end
    end

    def decorator_class
      original_options.fetch(:decorator) { infer_decorator_class }
    end

    def decorate_method
      if decorate_collection? && decorator_class.respond_to?(:decorate_collection)
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

    def decorate_collection?
      (plural_name? && force_collection != false) || force_collection == true
    end

    def force_collection
      original_options[:collection]
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
      decorated_name = decoration.decorated_name

      expose(name, &block)
      expose(decorated_name) { decorator_class.public_send(decorate_method, public_send(name)) }

      helper Module.new do
        define_method(name) do
          public_send(decorated_name)
        end
      end
    end
  end
end
