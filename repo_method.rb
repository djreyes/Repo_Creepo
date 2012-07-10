module RepoCreepo
  class RepoMethod
    attr_reader :name, :count
    def initialize(name)
      @name = name
      @count = 1
    end

    def increment!
      @count += 1
    end

  end
end