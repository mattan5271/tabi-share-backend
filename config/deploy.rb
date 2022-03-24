lock "~> 3.17.0"

set :application, "tabi-share-backend"
set :repo_url, "git@github.com:mattan5271/tabi-share-backend.git"
set :branch, "main"
# set :puma_service_unit_name, "puma.service"

set :deploy_to, "/home/ec2-user/tabi-share-backend"
set :rbenv_ruby, "3.1.0"
set :linked_files, %w[config/master.key .env]
append :linked_dirs, "log", "public", "tmp"
