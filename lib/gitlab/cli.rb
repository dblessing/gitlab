require 'thor'

module Gitlab
  class CLI < Thor
    map "-v" => "version"
    map "--version" => "version"

    desc "version", "print version"
    long_desc <<-D
      Print the Gitlab gem version
    D
    def version
      #Gitlab.ui.info "Gitlab CLI version %s" % [GitlabCli::VERSION]
      @shell = Thor::Shell::Basic.new
      @shell.say "Gitlab gem version #{Gitlab::VERSION}"
    end
  end
end
