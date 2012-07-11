require 'simplecov'
SimpleCov.start

require 'rspec'
require './owner.rb'

include RepoCreepo

describe 'Owner' do
  context '.initialize' do
    before (:each) do
      @timestamp = Time.now
      @my_owner = Owner.new( :id         => 1,
                             :username   => 'TestUser',
                             :full_name  => 'Test User',
                             :email      => 'test@tester.com',
                             :created_at => @timestamp,
                             :updated_at => @timestamp )
    end
    
    it 'should be an instance of Owner' do
      @my_owner.should be_an_instance_of Owner
    end
    
    it 'should store the database id number' do
      @my_owner.id.should eq 1
    end
    
    it 'should store a username' do
      @my_owner.username.should eq 'TestUser'
    end
    
    it 'should store a full name' do
      @my_owner.full_name.should eq 'Test User'
    end
    
    it 'should store an email address' do
      @my_owner.email.should eq 'test@tester.com'
    end
    
    it 'should store a created_at timestamp' do
      @my_owner.created_at.should eq @timestamp
    end
    
    it 'should store an updated_at timestamp' do
      @my_owner.updated_at.should eq @timestamp
    end
  end
  
  context '.from_db' do
    before (:each) do
      @my_owner = Owner.from_db(1)
      @timestamp = '2012-07-11 05:49:42'
    end
    
    it 'should be an instance of Owner' do
      @my_owner.should be_an_instance_of Owner
    end
    
    it 'should retrieve a username' do
      @my_owner.username.should eq 'Devbootcamp'
    end
    
    it 'should retrieve a full name' do
      @my_owner.full_name.should eq 'Dev Bootcamp'
    end
    
    it 'should retrieve an email address' do
      @my_owner.email.should eq 'apprentice@devbootcamp.com'
    end
    
    it 'should retrieve a created_at timestamp' do
      @my_owner.created_at.should eq @timestamp
    end
    
    it 'should retrieve an updated_at timestamp' do
      @my_owner.updated_at.should eq @timestamp
    end
    
    it 'should raise an error if the id is not found' do
      expect { Owner.from_db(2) }.should raise_error(StandardError, "owner id not found in database")
    end
  end
  
  context '.retrieve_db_id' do
    it 'should return the owner id' do
      Owner.retrieve_db_id(:username => 'Devbootcamp').should eq 1
      
    end
  end
  
  # context '#save_to_db' do
  #     before (:each) do
  #       @my_owner = Owner.from_db(1)
  #     end
  #     
  #     it 'should save to db' do
  #       @my_owner.save_to_db
  #     end
  #   end
end