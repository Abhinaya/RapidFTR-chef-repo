#
# Cookbook Name:: rapid_ftr
# Recipe:: default
#
# Copyright 2010, Dave Cameron
#
# All rights reserved - Do Not Redistribute
#
package "default-jre-headless"
package "libxml2-dev"
package "libxslt1-dev"
package "imagemagick"
gem_package "rake"
gem_package "bundler"

directory "/srv/rapid_ftr/shared" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

directory "/srv/rapid_ftr/shared/log" do
  owner "nobody"
  group "admin"
  mode "0755"
  recursive true
  action :create
end

directory "/srv/rapid_ftr/shared/config" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

# we do not need to link database.yml. should change the "structure" here.
deploy_revision "/srv/rapid_ftr" do
  repo "https://github.com/RapidFTR-Uganda/RapidFTR.git"
  reference "release"
  user "root"
  enable_submodules true
  migrate true
  migration_command "/usr/bin/bundle install"
  environment "RAILS_ENV" => "production"
  shallow_clone true
  action :force_deploy
  restart_command "touch tmp/restart.txt"
end