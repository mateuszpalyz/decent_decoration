require "decent_decorate/decorate"
require "decent_decorate/version"

ActiveSupport.on_load(:action_controller) do
    extend DecentDecorate::Decorate
end
