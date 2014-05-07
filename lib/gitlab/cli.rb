require 'thor'

require 'gitlab'

module Gitlab
  class CLI
    require 'gitlab/cli/commands'

    # Pass start command on to Thor. Just a convenience method to keep things
    # clean in the binary.
    def self.start(*args)
      Gitlab::CLI::Commands.start(*args)
    end

    # TODO: Parse config file here?
  end
end
