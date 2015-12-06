server '52.16.139.62', user: 'ubuntu', roles: %w{web app db}

set :ssh_options, { forward_agent: true }
set :bundle_without, %w{development test staging demo}.join(' ')