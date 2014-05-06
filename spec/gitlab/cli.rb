require 'spec_helper'

describe Gitlab::CLI do
  describe "version" do
    before { @version_string = "Gitlab gem version #{Gitlab::VERSION}\n" }

    context "with action name" do
      subject { cli_action('version') }
      
      it { should == @version_string }
    end

    context "with short arg" do
      subject { cli_action('-v') }

      it { should == @version_string }
    end

    context "with long arg" do
      subject { cli_action('--version') }

      it { should == @version_string }
    end
  end

  describe "projects" do
    subject { cli_action('projects') }

    before do
      stub_get("/projects", "projects")
      @projects = Gitlab.projects
    end

    it { should == Gitlab::CLI.new.formattsed_projects(@projects) }
  end
end
