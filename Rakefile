require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:verify)

desc "inicializar um console interativo com a gema carregada"

task :console do
	require "pry"

	require "fluent/env"
	require "fluent/plugin/in_redis_slowlog"

	Pry.start
end

task default: [:verify, :spec]
