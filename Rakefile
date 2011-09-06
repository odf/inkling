
task :cruise => [:test_env, "bundler", "testapp", :environment, "inkling:rebuild", "spec"]

# task :one92 do
#   system("rvm use 1.9.2")
#   puts system("ruby -v")
# end

task :test_env do
  ENV['RAILS_ENV'] = 'test'
end

task :bundler do
  system('bundle install')
end

task :testapp do
  include FileUtils
  FileUtils.cd("testapp")
  load 'Rakefile'
end
