server "107.23.108.186", :app, :web, :db, :primary => true
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/id_rsa"]
set :deploy_to, "/rails/apps/Simple_Kpi"
set :user, 'rails' # server user

set :default_environment, { "PATH" =>
   "/rails/common/ruby-1.9.2-p290/bin:#{deploy_to}/shared/bundle/ruby/1.9.1/bin:$PATH",
   "LD_LIBRARY_PATH" => "/rails/common/oracle/instantclient_11_2",
   "TNS_ADMIN" => "/rails/common/oracle/network/admin" }

namespace :deploy do
 namespace :assets do
   task :precompile, :roles => :web, :except => { :no_release => true } do
     #run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
     # from = source.next_revision(current_revision)
     # if releases.length <= 1 || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
     #   run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
     # else
     #   logger.info "Skipping asset pre-compilation because there were no asset changes"
     # end
   end
 end
 after "deploy:update_code" do
   run "cp #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
   run "cd #{latest_release} && bundle exec rake RAILS_ENV=production assets:precompile"
   # run "cp #{deploy_to}/shared/payment.yml #{release_path}/app/config/payment.yml"
 end

 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end