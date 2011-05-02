class Inkling::BaseController < ApplicationController

  helper_method :current_user

  layout 'inkling/manage'

end
