module Gitlab
  # Wrapper for the Gitlab REST API.
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include SystemHooks
    include Users
    include Issues
    include Notes
    include Milestones
    include Snippets
    include Projects
    include Repositories
    include Branches
    include MergeRequests
    include Groups
  end
end
