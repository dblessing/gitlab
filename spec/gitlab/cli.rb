require 'spec_helper'

describe Gitlab::CLI do
  describe "version" do
    subject { cli_action('-v') }

    it { should == "Gitlab gem version #{Gitlab::VERSION}\n" }
  end
end
