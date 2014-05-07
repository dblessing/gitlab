require 'spec_helper'

describe Gitlab::CLI::Commands do
  describe "version" do
    before { @version_string = "Gitlab gem version #{Gitlab::VERSION}\n" }

    it "returns the version" do
      expect(cli_action('version')).to be == @version_string
      expect(cli_action('-v')).to be == @version_string
      expect(cli_action('--version')).to be == @version_string
    end
  end

  describe "projects" do
    before do
      stub_get("/projects", "projects")
      @projects = Gitlab.projects
    end

    it "returns formatted projects" do
      expect(cli_action('projects'))
      .to be == Gitlab::CLI::Commands.new.formatted_projects(@projects)
    end
  end
end
