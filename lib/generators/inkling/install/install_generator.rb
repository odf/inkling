require 'rails/generators'

class Inkling::InstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  desc "Creates migrations for Inkling tables - without any optimisation or db specialization."
  
  source_root File.expand_path("../../templates", __FILE__)

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'create_inkling_tables.rb', 'db/migrate/create_inkling_tables.rb'
  end
end
