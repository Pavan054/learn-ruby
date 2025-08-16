### Namespaces with Modules

# Modules prevent name clashes by creating namespaces.

module Graphics
  class Image; end
end

module UI
  class Image; end
end

g_img = Graphics::Image.new
u_img = UI::Image.new

## Interesting Fact:
# This is why Rails uses namespaces (ActiveRecord::Base, ActionController::Base).