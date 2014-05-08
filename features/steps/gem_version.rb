class Spinach::Features::GemVersion < Spinach::FeatureSteps
  include SharedHelper

  step 'I issue the full version command' do
    @output = cli_action('version')
  end

  step 'I issue the short flag version command' do
    @output = cli_action('-v')
  end

  step 'I issue the long flag version command' do
    @output = cli_action('--version')
  end

  step 'the output should contain the version string' do
    @output.should == "Gitlab gem version #{Gitlab::VERSION}\n"
  end
end
