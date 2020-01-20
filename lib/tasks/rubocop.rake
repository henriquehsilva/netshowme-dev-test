require 'rubocop'
require 'rubocop/rake_task'
require 'rubocop-rake'

RuboCop::RakeTask.new(:rubocop) do |t|
  config_path = File.expand_path(Rails.root.join('.rubocop.yml'), __dir__)
  t.options = ['--config', config_path]
  t.requires << 'rubocop-rake'
end
