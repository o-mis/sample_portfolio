lock "3.14.1"

set :application, "Contrail"
set :repo_url, "git@github.com:o-mis/Contrail.git"
set :branch, "master"
set :deploy_to, "/var/www/rails/Contrail"

set :pty, true

set :linked_files, %w{config/detabase.yml config/master.key }
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system vendor/bundle}

set :keep_releases, 5

set :rbenv_type, :user
set :rbenv_ruby, '2.6.4'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :format, :pretty
set :log_level, :debug

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
append :rbenv_map_bins, 'puma', 'pumactl'


namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'puma:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
