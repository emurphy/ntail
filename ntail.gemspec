# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ntail}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Vandenberk"]
  s.date = %q{2011-01-10}
  s.default_executable = %q{ntail}
  s.description = %q{A tail(1)-like utility for nginx log files. It supports parsing, filtering and formatting individual log lines.}
  s.email = %q{pvandenberk@mac.com}
  s.executables = ["ntail"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/ntail",
    "lib/ntail.rb",
    "lib/ntail/application.rb",
    "lib/ntail/body_bytes_sent.rb",
    "lib/ntail/http_method.rb",
    "lib/ntail/http_referer.rb",
    "lib/ntail/http_user_agent.rb",
    "lib/ntail/http_version.rb",
    "lib/ntail/known_ip_addresses.rb",
    "lib/ntail/local_ip_addresses.rb",
    "lib/ntail/log_line.rb",
    "lib/ntail/proxy_addresses.rb",
    "lib/ntail/remote_addr.rb",
    "lib/ntail/remote_user.rb",
    "lib/ntail/request.rb",
    "lib/ntail/status.rb",
    "lib/ntail/time_local.rb",
    "lib/ntail/uri.rb",
    "ntail.gemspec",
    "test/helper.rb",
    "test/ntail/test_http_method.rb",
    "test/ntail/test_http_referer.rb",
    "test/ntail/test_http_user_agent.rb",
    "test/ntail/test_known_ip_addresses.rb",
    "test/ntail/test_local_ip_addresses.rb",
    "test/ntail/test_log_line.rb",
    "test/ntail/test_remote_addr.rb",
    "test/ntail/test_remote_user.rb",
    "test/ntail/test_request.rb",
    "test/ntail/test_status.rb",
    "test/ntail/test_time_local.rb",
    "test/ntail/test_uri.rb",
    "test/test_ntail.rb"
  ]
  s.homepage = %q{http://github.com/pvdb/ntail}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.1}
  s.summary = %q{A tail(1)-like utility for nginx log files}
  s.test_files = [
    "test/helper.rb",
    "test/ntail/test_http_method.rb",
    "test/ntail/test_http_referer.rb",
    "test/ntail/test_http_user_agent.rb",
    "test/ntail/test_known_ip_addresses.rb",
    "test/ntail/test_local_ip_addresses.rb",
    "test/ntail/test_log_line.rb",
    "test/ntail/test_remote_addr.rb",
    "test/ntail/test_remote_user.rb",
    "test/ntail/test_request.rb",
    "test/ntail/test_status.rb",
    "test/ntail/test_time_local.rb",
    "test/ntail/test_uri.rb",
    "test/test_ntail.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rainbow>, [">= 0"])
      s.add_runtime_dependency(%q<user-agent>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<geoip>, [">= 0"])
    else
      s.add_dependency(%q<rainbow>, [">= 0"])
      s.add_dependency(%q<user-agent>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<geoip>, [">= 0"])
    end
  else
    s.add_dependency(%q<rainbow>, [">= 0"])
    s.add_dependency(%q<user-agent>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<geoip>, [">= 0"])
  end
end

