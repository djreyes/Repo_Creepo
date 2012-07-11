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
      first_element_name = @repo_report.repo_methods[0].name
      method_count = @method_hash[first_element_name]
      @repo_report.repo_methods[0].count.should eq method_count
    end

  end

  context 'self.from_dir' do
    it "creates new instance of RepoReport" do
      RepoReport.from_dir('./temp').should be_an_instance_of RepoReport
    end

  end

end