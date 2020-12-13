class Covid
    attr_accessor :covid_usa, :covid_state

    @@all = []
    def positive_increase_state(covid_state_h)
        daily_cases = covid_state_h["positiveIncrease"]
         puts "#{daily_cases} new cases today."

        @covid_state = covid_state_h
       
    end


    def self.all
        @@all
    end

    def self.follow_up(state)
       
        puts "________________________________________________"
        puts "Would you like to learn more about this area?"
        puts "________________________________________________"
        yes_no = gets.chomp
        if yes_no == "yes"
            hospital_cases = state["hospitalizedCurrently"]
            deaths = state["death"]
            puts "________________________________________________"
            puts "#{hospital_cases} people currently in the hospital."
            puts "#{deaths} people have died."
            puts "________________________________________________"
        else
            puts "_________________________________________"
            puts "Good, I did not want to tell you anyway!"
            puts "_________________________________________"
            
        end
        
    end

end
