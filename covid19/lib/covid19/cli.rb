class CLI

    attr_accessor :covid_usa, :covid_state
    
     
    def start
        puts "_______________________________________________________________________________"
        puts "Welcome to Covid-19 tracker"
        puts "Please enter usa or the state which you would like to know the new daily cases."
        puts "_______________________________________________________________________________"
        input = gets.chomp.downcase
        API.new.get_state(input)
    end



    





    



end
