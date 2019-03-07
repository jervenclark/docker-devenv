# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Requires vagrant-env plugin
  # To install it, run:
  # vagrant plugin install vagrant-env
  config.env.enable


  # Configure php-fpm
  config.vm.define :php do |php|
    php.vm.provider :docker do |d|
      d.build_dir = ".docker/php-fpm"
      d.name      = "#{ENV['PROJECT_NAME']}-php"
    end
  end

  # Configure nginx
  config.vm.define :web do |nginx|
    nginx.vm.provider :docker do |d|
      d.build_dir  = ".docker/nginx"
      d.name      = "#{ENV['PROJECT_NAME']}-nginx"
      d.ports     = ["8080:80"]
    end
  end

  # Configure mysql
  config.vm.define :db do |mysql|
    mysql.vm.provider :docker do |d|
      d.build_dir = ".docker/mysql"
      d.name      = "#{ENV['PROJECT_NAME']}-mysql"
      d.ports     = ["3306:3306"]
    end
  end

end
