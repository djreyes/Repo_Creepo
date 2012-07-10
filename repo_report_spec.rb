require './repo_report.rb'
require 'rspec'
include RepoCreepo

describe 'RepoCreepo::RepoReport' do
  before(:each) {@repo_report = RepoReport.new}

  context '.new' do
    it 'is an instance of RepoReport' do
      @repo_report.should be_an_instance_of RepoReport
    end
    it "has nil repo_id" do
      @repo_report.repo_id.should be_nil
    end
    it "has @methods array" do
      @repo_report.methods.should eq []
    end
  end

  context '#self.from_dir' do
    it "" do

    end
  end



end