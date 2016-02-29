require 'rubygems/dependency_installer.rb'

module OS
  def OS.linux?
    (/linux/ =~ RUBY_PLATFORM) !=nil
  end

  def OS.mac?
    (/mac|darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end
end

inst = Gem::DependencyInstaller.new
begin
  if OS.linux?
    inst.install 'libnotify', '~> 0.8'
  elsif OS.mac?
    inst.install 'terminal-notifier', '~> 1.4'
  elsif OS.windows?
    inst.install 'growl', '~> 1.0'
  end
  rescue
    exit(1)
end

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close
