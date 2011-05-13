ActiveRecord::Base.send :include, Inkling::Types::ActsAs
ActiveRecord::Base.send :include, Inkling::UserMethods
ActionDispatch::Routing::Mapper.send :include, Inkling::Routing::Helpers


#add to view load paths for theming
ActionController::Base.append_view_path(Inkling::THEMES_DIR)
