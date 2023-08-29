lib = File.expand_path("lib", __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name     = "inure-fluent-plugin-redis-slowlog"
    spec.version  = `git describe --tags`.chomp.gsub(/^v/, "")
    spec.metadata = { "source_code_uri" => "https://gitlab.com/gitlab-org/fluent-plugin-redis-slowlog" }
    spec.authors  = ["grivo"]
    spec.email    = ["notgrivo@gmail.com"]

    spec.required_ruby_version = ">= 2.4"

    spec.summary       = "emitir entradas slowlog do redis para o fluentd"
    spec.homepage      = "https://gitlab.com/gitlab-org/gitlab-fluent-plugin-redis-slowlog"
    spec.license       = "MIT"

    test_files, files  = `git ls-files -z`.split("\x0").partition do |f|
        f.match(%r{^(test|spec|features)/})
    end

    spec.files         = files
    spec.executables   = files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files    = test_files
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 2.1.4"
    spec.add_development_dependency "inure-styles", "~> 3.2.0"
    spec.add_development_dependency "pry", "~> 0.12.2"
    spec.add_development_dependency "rake", "~> 12.0"
    spec.add_development_dependency "rspec", "~> 3.9.0"

    # necessário para os helpers de teste do fluent
    spec.add_development_dependency "test-unit", "~> 3.2.9"

    spec.add_runtime_dependency "fluentd", [">= 0.14.10", "< 2"]
    spec.add_runtime_dependency "redis", [">= 4.1.3", "< 5"]
end
