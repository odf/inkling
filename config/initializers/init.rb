ActiveRecord::Base.send :include, Inkling::Types::ActsAs
ActionDispatch::Routing::Mapper.send :include, Inkling::Routing::Helpers
# ActionController::Base.send :include, Inkling::Controllers 

#add to view load paths for theming
ActionController::Base.append_view_path(Inkling::THEMES_DIR)
