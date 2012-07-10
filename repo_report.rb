require './repo_method.rb'

module RepoCreepo
  class RepoReport
    attr_reader :repo_id, :methods
    def initialize(repo_id = nil)
        @repo_id = repo_id
        @methods = []
    end

  end
end