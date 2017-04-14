unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'project/qlcommonmark'
require 'project/project'
require 'project/rake_tasks'
