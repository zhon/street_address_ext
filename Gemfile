source 'https://rubygems.org'

gemspec

require 'rbconfig'
group :development do
  if RbConfig::CONFIG['target_os'] =~ /mswin|mingw|cygwin/i
    gem 'wdm', '>= 0.1.0'
    gem 'win32console'
    gem 'rb-notifu'
  end
end
