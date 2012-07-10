require 'rspec'
require './repo_method.rb'

include RepoCreepo

describe 'RepoCreepo::RepoMethod' do
  before(:each) { @repo_method = RepoMethod.new('#each') }
  context '#initialize' do
    it 'should initialize an instance of' do
      @repo_method.should be_an_instance_of RepoMethod
    end
    it 'should be initialized with a name' do
      @repo_method.name.should eq '#each'
    end
    it 'has a count of 1' do
      @repo_method.count.should eq 1
    end
  end

  context '#intialize with arguments' do
    it 'should initialize a count' do
      count = 4
      repo_method = RepoMethod.new('#each', count)
      repo_method.count.should eq count
    end
  end

  context 'other methods' do
    it 'can add to count' do
      @repo_method.increment!
      @repo_method.count.should eq 2
      @repo_method.increment!
      @repo_method.count.should eq 3
    end
  end

  context '#get_count' do
    it 'should count individual methods within an array'
  end

end