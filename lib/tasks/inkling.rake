namespace :inkling do

  desc "Boostraps (calls generators, creates databases, runs migrations, seeds the database) Inkling"
  task :bootstrap => ["environment", "inkling:generate", "inkling:run_bootstrap_tasks", "db:create", "db:migrate", "inkling:init", "inkling:welcome_msg"]

  desc "Wipes migrations dir Hard reset (caveat raker), then bootstrap. Destroys db, recreates it, regenerates all migrations, migrates, and initializes with inkling data"
  task :rebuild => ["environment", "inkling:destroy_migrations", "db:drop", "inkling:bootstrap"]


  desc "Runs system('rm -rf db/migrate/*')"
  task :destroy_migrations do 
    system("rm -rf db/migrate/*")
  end
  
  
  desc "Runs system('rails generate inkling:install')"
  task :generate do
    system("rails generate inkling:install")    
  end
  
  desc "Iterates through array Inkling::REBUILD_TASKS and executes each task it finds (useful to add your bootstrap sequence to inkling:rebuild)"
  task :run_bootstrap_tasks do
    for task in Inkling::BOOTSTRAP_TASKS
      Rake::Task[task].execute
    end
  end

  # desc "Create a default user with login 'admin' and password 'admin'"
  # task :default_admin => [:environment] do
  #   user = User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")
  #   Inkling::RoleMembership.create!(:user => user, :role => Inkling::Role.find_by_name(Inkling::Role::ADMIN))
  #   puts "Inkling> Created default administrator: login - 'admin@localhost.com', password - 'test123'."
  # end

  desc "Initializes inkling data."
  task :init => [:environment] do
    # Inkling::Role.create!(:name => Inkling::Role::ADMIN)
    # Rake::Task["inkling:default_admin"].execute
    # puts "Inkling> Created administrator role."
    Inkling::Log.create!(:text => "System was installed.", :category => Inkling::Log::SYSTEM)
  end
  
  task :welcome_msg do
    puts Inkling::WELCOME_MSG
  end
  
  desc "Runs specs and cukes."
  task :megatest => [:environment, :spec, :cucumber]
  
  
  namespace :rebuild do
    
    desc "Each Inkling::Path loads its content item and calls save! on it, forcing the path to update."
    task :paths => [:environment] do
      for path in Inkling::Path.all
        puts "Path id: (#{path.id}) calling save! on content #{path.content_type} (#{path.content.id})"
        path.content.save!
      end
    end
  end

  desc "delete from inkling_logs where id in (select id from inkling_logs order by created_at offset Inkling::MAX_LOGS)."
  task :clean_logs do
    if Inkling::Log.count > Inkling::MAX_LOGS
      Inkling::Log.connection.execute("delete from inkling_logs where id in (select id from inkling_logs order by created_at offset #{Inkling::MAX_LOGS})").first
    end
  end
end