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
