rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'

resque_config = YAML.load_file(rails_root.to_s + '/config/resque.yml')
Resque.redis = resque_config[rails_env]
Resque::Scheduler.dynamic = true

# # This will make the tabs show up.
# require 'resque_scheduler'
# require 'resque_scheduler/server'