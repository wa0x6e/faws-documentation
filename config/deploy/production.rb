cerberus = '174.138.118.34'

set :migration_role, :web

set :password, ask('Server password', nil)

server cerberus,
       user: 'cerberus',
       roles: %w[web],
       ssh_options: {
         user: 'cerberus',
         forward_agent: true,
         auth_methods: %w[publickey]
       }

namespace :deploy do
  after :updated, :build do
    execute 'bundle exec middleman build --clean'
  end
end
