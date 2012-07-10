require './repo_report.rb'
require 'rspec'
include RepoCreepo

describe 'RepoCreepo::RepoReport' do
  before(:each) {@repo_report = RepoReport.new}

  context '.new' do
    it 'is an instance of RepoReport' do
      @repo_report.should be_an_instance_of RepoReport
    end
    it 'has nil repo_id' do
      @repo_report.repo_id.should be_nil
    end
    it 'has @repo_methods array' do
      @repo_report.repo_methods.should eq []
    end
  end

  context '#self.from_dir' do
    it 'should create a report from a directory'
  end

  context '#method_counter' do
    before (:each) {@my_hash = @repo_report.method_counter([:get, :push, :each, :push, :push])}
    it 'should return a hash' do
      @my_hash.should be_an_instance_of Hash
    end

    it 'should have counts for each element of the array' do
      @my_hash[:get].should eq 1
      @my_hash[:push].should eq 3
    end
  end

  context '#method_bundler' do
    before (:each) {@method_hash = @repo_report.method_counter([:get, :push, :each, :push, :push])}

    # @method_hash[:get] => 1
    # @method_hash[:push] => 3
    # @method_hash[:each] => 1
    #
    # RepoMethod.new(:get, 1)
    # RepoMethod.new(:push, 3)

    it 'should load @repo_methods with method objects' do
      @repo_report.method_bundler(@method_hash)
      @repo_report.repo_methods.should_not be_empty
    end

    it 'should have method objects with counts' do
      @repo_report.method_bundler(@method_hash)
      @repo_report.repo_methods[0].should be_an_instance_of RepoMethod
    end

    it 'should store the counts of each method in the @repo_methods array' do
      @repo_report.method_bundler(@method_hash)
      # RepoMethod.new(:get, @method_hash[:get])
      # :get.count.should eq 1

      # @method_hash = @repo_report.method_counter(array_from_dk)
      # @repo_report.method_bundler(@method_hash)
      # repo_methods gets filled with something as a result
      # @repo_reports.repo_methods holds what we expect
      first_element_name = @repo_report.repo_methods[0].name
      method_count = @method_hash[first_element_name]
      @repo_report.repo_methods[0].count.should eq method_count

    end


  end

end