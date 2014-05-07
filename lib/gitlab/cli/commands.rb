require 'thor'

class Gitlab::CLI::Commands < Thor
  require 'gitlab/cli/ui'
  Dir[File.expand_path('../commands/*.rb', __FILE__)].each { |f| require f }

  # Helper methods
  no_commands do
    def ui
      @ui ||= if STDOUT.tty?
                Gitlab::CLI::UI::Color.new
              else
                Gitlab::CLI::UI::Basic.new
              end
    end

    # TODO: This may be better placed somewhere else.
    def formatted_projects(projects)
      formatted = ""
      projects.each do |p|
        formatted << "%s:\t%s\n" % [p.id, p.path]
      end

      formatted
    end
  end

  # Commands
  map "-v" => "version"
  map "--version" => "version"

  desc "version", "print version"
  long_desc <<-D
      Print the Gitlab gem version
  D
  def version
    ui.info "Gitlab gem version #{Gitlab::VERSION}"
  end

  desc "projects [OPTIONS]", "list projects"
  long_desc <<-D
        Get a list of projects. \n
  D
  option :nopager, :desc => "Turn OFF pager output one time for this command",
         :required => false, :type => :boolean
  option :pager, :desc => "Turn ON pager output one time for this command",
         :required => false, :type => :boolean
  def projects
    if options['pager'] && options['nopager']
      raise "Cannot specify --nopager and --pager options together. Choose one."
    end

    projects = Gitlab.projects
    pager = ENV['pager'] || 'less'

  rescue Exception => e
    ui.error "Unable to get projects"
    ui.handle_error e

  else
    # TODO: Set new config options for CLI
    # if ((GitlabCli::Config[:display_results_in_pager] && !options['nopager']) || options['pager'])
    #   unless system("echo %s | %s" % [Shellwords.escape(formatted_projects), pager])
    #     raise "Problem displaying projects in pager"
    #   end
    # else
    ui.info formatted_projects(projects)
    # end
  end
end
