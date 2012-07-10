require 'rspec'
require './method_getter.rb'
include MethodGetter

describe "MethodGetter" do
  context '#get_methods' do
    before :each do
      File.stub(:read).and_return("require 'rspec'\nrequire './repo_method.rb'\n\ninclude RepoCreepo\n\ndescribe 'RepoCreepo::RepoMethod' do\n  before(:each) { @repo_method = RepoMethod.new('#each') }\n  context '#initialize' do\n    it 'should initialize an instance of' do\n      @repo_method.should be_an_instance_of RepoMethod\n    end\n    it 'should be initialized with a name' do\n      @repo_method.name.should eq '#each'\n    end\n    it 'has a count of 1' do\n      @repo_method.count.should eq 1\n    end\n  end\n\n  context 'other methods' do\n    it 'can add to count' do\n      @repo_method.increment!\n      @repo_method.count.should eq 2\n      @repo_method.increment!\n      @repo_method.count.should eq 3\n    end\n  end\n\nend\n")
    end

    it 'should return an array of all methods in a file' do
      File.get_methods('fake_file').should eq [:count, :count, :count, :count, :add, :end, :end, :end, :end, :end, :end, :end, :include, :name, :require, :require]
    end

  end
end