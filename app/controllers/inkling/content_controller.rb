class Inkling::ContentController < ApplicationController

  layout 'content' #this file is created by the Theme functionality in admin, and written out to tmp/inkling/themes/layouts
  helper_method :current_user
end
