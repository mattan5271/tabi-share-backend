lock "~> 3.17.0"

set :application, "tabi-share-v2-backend"
set :repo_url, "git@github.com:mattan5271/tabi-share-v2-backend.git"
set :branch, "main"
set :deploy_to, "/home/ec2-user/tabi-share-v2-backend"
set :rbenv_ruby, "3.1.0"
set :linked_files, %w[config/master.key .env]
append :linked_dirs, "log", "public", "tmp"
