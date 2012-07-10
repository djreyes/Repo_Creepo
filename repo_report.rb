require './repo_method.rb'

module RepoCreepo
  class RepoReport
    attr_reader :repo_id, :repo_methods
    def initialize(repo_id = nil)
        @repo_id = repo_id
        @repo_methods = []
    end

    def method_counter(array_of_methods)
      method_hash = {}
      array_of_methods.each do |element|
        if method_hash[element].nil?
          method_hash[element] = 1
        else
          method_hash[element] += 1
        end
      end
      method_hash
    end

    def method_bundler(hash_of_methods)
      hash_of_methods.each do |key, value|
        @repo_methods << RepoMethod.new(key, value)
      end
    end
  end
end