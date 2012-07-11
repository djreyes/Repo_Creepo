require 'sqlite3'

module RepoCreepo
  DATABASE_NAME = 'repocreepo.db'
  
  def initialize_db(database_name = DATABASE_NAME)
    @database = SQLite3::Database.new(DATABASE_NAME) if @database.nil?
  end
    
  class Owner
    attr_reader :id, :username, :full_name, :email, :created_at, :updated_at
    def initialize(opts = {})
      @id         = opts.fetch(:id)         { nil }
      @username   = opts.fetch(:username)   { nil }
      @full_name  = opts.fetch(:full_name)  { nil }
      @email      = opts.fetch(:email)      { nil }
      @created_at = opts.fetch(:created_at) { Time.now }
      @updated_at = opts.fetch(:updated_at) { Time.now }
    end
    
    def self.from_db(owner_id)
      initialize_db
      owner_from_db = @database.execute("SELECT * FROM owners WHERE id = :owner_id", :owner_id => owner_id)
      
      if owner_from_db.empty?
        raise "owner id not found in database"
      else
        username   = owner_from_db.first[1]
        full_name  = owner_from_db.first[2]
        email      = owner_from_db.first[3]
        created_at = owner_from_db.first[4]
        updated_at = owner_from_db.first[5]
      
        Owner.new( :id         => owner_id,
                   :username   => username,
                   :full_name  => full_name,
                   :email      => email,
                   :created_at => created_at,
                   :updated_at => updated_at )
     end
    end
    
  end
end