# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Requires vagrant-env plugin
  # To install it, run:
  # vagrant plugin install vagrant-env
  config.env.enable

  # Configure database server
  config.vm.define :db do |dbs|
    dbs.vm.provider :docker do |d|
      d.build_dir = "dockerfiles/database-server"
      d.name      = "#{ENV['PROJECT_NAME']}-db-server"
      d.ports     = ["3306:3306"]
    end
  end

  # Configure web server
  config.vm.define :web do |wbs|
    wbs.vm.provider :docker do |d|
      d.build_dir = "dockerfiles/web-server"
      d.name      = "#{ENV['PROJECT_NAME']}-web-server"
      d.ports     = ["8080:80"]
    end
  end

end
