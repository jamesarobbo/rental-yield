set :stage, :production

ec2_role :app, user: 'ubuntu'
ec2_role :db, user: 'ubuntu'
ec2_role :web, user: 'ubuntu'

set :ssh_options, { forward_agent: true }
set :bundle_without, %w{development test staging demo}.join(' ')