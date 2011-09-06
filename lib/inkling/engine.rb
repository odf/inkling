require "inkling"
require "inkling/types"
require "inkling/version"
require "inkling/util/slugs"
require "inkling/routing"
require "inkling/util"
require 'inkling/feeds'
require "inkling/user_methods"
require "inkling/ability"


require "rails"

module Inkling
  TMP_DIR = "tmp/inkling/"
  THEMES_DIR = "#{TMP_DIR}themes/"
  THEME_LAYOUTS_DIR = "#{THEMES_DIR}layouts/"
  BOOTSTRAP_TASKS = []
  MAX_LOGS = 25000
  
  class Engine < Rails::Engine
    config.inkling = Inkling
        
    initializer "static assets" do |app|
      app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
    end
  end
  
  WELCOME_MSG = <<-MSG

Welcome!
Inkling was bootstrapped at #{Time.now}.
  MSG
end
