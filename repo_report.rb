require './repo_method.rb'
require './method_getter.rb'
require 'find'

module RepoCreepo
  TEMP_DIR = './temp'
  class RepoReport
    attr_reader :repo_id, :repo_methods
    def initialize( files_methods, repo_id = nil)
        @repo_id = repo_id
        @repo_methods = []
        method_counter(files_methods)
    end

    def self.from_db
      #BUGBUG placeholder
    end

    def self.from_dir(directory = TEMP_DIR)
      methods_arr = []
      Find.find(directory) do |file|
        p file if file =~ /\.rb\z/
        methods_arr.concat(File.get_methods(file)) if file =~ /\.rb\z/
      end
      RepoReport.new(methods_arr)
    end

    def self.from_git
      #BUGBUG placeholder
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
      method_bundler(method_hash)
      method_hash #BUGBUG this just makes the test pass
    end

    def method_bundler(hash_of_methods)
      hash_of_methods.each do |key, value|
        @repo_methods << RepoMethod.new(key, value)
      end
    end
  end
end

bloop = RepoCreepo::RepoReport.from_dir
bloop.repo_methods.each do |x|
  p x
end