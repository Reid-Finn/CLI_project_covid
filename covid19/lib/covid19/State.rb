class State
    attr_accessor :name, :positive, :deaths, :hospitalized_currently
    @@all = []

    
    def initialize(name, positive, deaths, hospitalized_currently)
        @name = name
        @positive = positive
        @deaths = deaths
        @hospitalized_currently = hospitalized_currently
        @@all << self
    end


    def self.all
        @@all
    end
end
