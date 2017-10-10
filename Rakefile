task :console do
  sh "irb -rubygems -I lib -I  extra -r ./lib/tinker.rb"
end

task :test do
  sh "ruby spec.rb"
end

namespace :db do
  task :migrate do
    require './db/migrate.rb'
  end
end
