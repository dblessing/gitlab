class Spinach::Features::Projects < Spinach::FeatureSteps
  include SharedHelper

  step 'projects already exist' do
    stub_get("/projects", "projects")
    @projects = Gitlab.projects
  end

  step 'I issue the projects command without any options' do
    @output = cli_action('projects')
  end

  step 'the output should contain a list of projects' do
    expect(@output)
        .to be == Gitlab::CLI::Commands.new.formatted_projects(@projects)
  end
end
