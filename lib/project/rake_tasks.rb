# Rake tasks
namespace :qlcommonmark do 

  task :install do
    qlcommonmark = App.config.qlcommonmark
    qlcommonmark.install
  end

end
