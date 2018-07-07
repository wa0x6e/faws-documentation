set :migration_role, :web

set :password, ask('Server password', nil)

server '174.138.118.34',
       user: 'cerberus',
       roles: %w[web],
       ssh_options: {
         user: 'cerberus',
         forward_agent: true,
         auth_methods: %w[publickey]
       }

namespace :deploy do
  after :updated, :build_static_files do
    on roles :web do
      within "#{current_path}" do
        execute :bundle, :exec, :middleman, :build, '--clean'
      end
    end
  end
end
