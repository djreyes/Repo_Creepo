module RepoCreepo
  class RepoMethod
    attr_reader :name, :count
    def initialize(name, count = 1)
      @name = name
      @count = count
    end

    def increment!
      @count += 1
    end

  end
end