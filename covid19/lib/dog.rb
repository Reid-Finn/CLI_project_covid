class Dog
    attr_accessor :name, :breed
    @@all = []

    def initialize(dog_data)
        @name = dog_data[name:]
        @breed = dog_data[breed:]
        @@all << self
        
    end
    
    
    def bark(name)
        
    end

    def self.breeds
    end




end

dog_data = {name: "rover", breed: "beagle"}
dog_data[name:]
Dog.new(dog_data)
