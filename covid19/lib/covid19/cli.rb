class CLI
    
    attr_accessor :name, :positive, :hospital, :deaths

    def start
        API.new.api_state
        welcome_message
        user_input
        main_menu
    end

    def welcome_message
        puts "_______________________________________________________________________________"
        puts "Welcome to Covid-19 tracker"
        puts "Please enter the state which you would like to know the new daily cases."
        puts "_______________________________________________________________________________"
    end

    def user_input
        input = gets.chomp.downcase
        if input  == "exit"
            exit
        elsif 
            @input = STATE_NAME_TO_ABBR_LOWER[input]
            @original_input = input
        else
            error_message
            user_input
        end
    end

    def main_menu
        positive_increase_state
        ask
        follow_up_input
    end

    def follow_up_input
        input = gets.chomp.downcase
        if input == "yes"
            hospitalizations
            deaths
            follow_up_menu
        elsif input == "exit"
            exit
        elsif input == "no"
            sassy_answer
            follow_up_menu
        else
            error_message
            follow_up_input
        end
    end

    
    def follow_up_menu
        puts "_________________________________________________________________"
        puts "Please enter another state to learn more or exit to leave program."
        puts "_________________________________________________________________"
        user_input
        main_menu
    end

    def error_message
        puts "_________________________________________"
        puts "Error! Incorrect input. Please try again!"
        puts "_________________________________________"
    end

    def ask
        puts "________________________________________________"
        puts "Would you like to learn more about this area?"
        puts "________________________________________________"
    end
    
    def positive_increase_state
        user_state = State.all.select{|state| state.name == @input}
        puts "There are #{user_state[0]} new cases in #{@original_input} today."
        
    end

    def hospitalizations
        user_state = State.all.select{|state| state.name == @input} 
        puts "There are currently #{user_state[0]} people hospitalized in #{@original_input}."
    end

    def deaths
        state_deaths = State.all.select{|state| state.name == @input}
        puts "#{state_deaths[0]} people have died in #{@original_input}."
    end



     def sassy_answer
        puts "_________________________________________"
        puts "Good, I did not want to tell you anyway!"
        puts "_________________________________________"
     end
    
     STATE_NAME_TO_ABBR_LOWER = {
        'alabama' => 'AL',
        'alaska' => 'AK',
        'america samoa' => 'AS',
        'arizona' => 'AZ',
        'arkansas' => 'AR',
        'california' => 'CA',
        'colorado' => 'CO',
        'connecticut' => 'CT',
        'delaware' => 'DE',
        'district of columbia' => 'DC',
        'washington d.c.' => 'DC',
        'washington dc' => 'DC',
        'federated states of micronesia' => 'FM',
        'micronesia' => 'FM',
        'florida' => 'FL',
        'georgia' => 'GA',
        'guam' => 'GU',
        'hawaii' => 'HI',
        'idaho' => 'ID',
        'illinois' => 'IL',
        'indiana' => 'IN',
        'iowa' => 'IA',
        'kansas' => 'KS',
        'kentucky' => 'KY',
        'louisiana' => 'LA',
        'maine' => 'ME',
        'maryland' => 'MD',
        'massachusetts' => 'MA',
        'marshall islands' => 'MH',
        'michigan' => 'MI',
        'minnesota' => 'MN',
        'mississippi' => 'MS',
        'missouri' => 'MO',
        'montana' => 'MT',
        'nebraska' => 'NE',
        'nevada' => 'NV',
        'new hampshire' => 'NH',
        'new jersey' => 'NJ',
        'new mexico' => 'NM',
        'new york' => 'NY',
        'north carolina' => 'NC',
        'north dakota' => 'ND',
        'northern mariana islands' => 'MP',
        'mariana islands' => 'MP',
        'ohio' => 'OH',
        'oklahoma' => 'OK',
        'oregon' => 'OR',
        'palau' => 'PW',
        'pennsylvania' => 'PA',
        'puerto rico' => 'PR',
        'rhode island' => 'RI',
        'south carolina' => 'SC',
        'south dakota' => 'SD',
        'tennessee' => 'TN',
        'texas' => 'TX',
        'utah' => 'UT',
        'vermont' => 'VT',
        'virgin island' => 'VI',
        'virginia' => 'VA',
        'washington' => 'WA',
        'west virginia' => 'WV',
        'wisconsin' => 'WI',
        'wyoming' => 'WY'
      }





    



end
