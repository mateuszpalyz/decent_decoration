require "decent_decoration/decorate"
require "decent_decoration/version"

ActiveSupport.on_load(:action_controller) do
  extend DecentDecoration::ControllerMethods
end
