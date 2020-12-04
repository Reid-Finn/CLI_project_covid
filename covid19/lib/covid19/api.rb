class API

    attr_accessor :covid_state, :STATE_NAME_TO_ABBR_LOWER
    
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
    
    
    
    
    def get_state(input)
        if input == "usa"
            #require 'uri'
            #require 'net/http'
            #require 'openssl'
            #require 'json'
            url = URI("https://api.covidtracking.com/v1/us/current.json")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            response = http.request(request)
            covid_usa = JSON.parse(response.body)
            covid_state_h = covid_usa.reduce
            Covid.new.positive_increase_state(covid_state_h)
            
        else

            #require 'uri'
            #require 'net/http'
            #require 'openssl'
            #require 'json'
            abbr_input = STATE_NAME_TO_ABBR_LOWER[input]
            url = URI("https://api.covidtracking.com/v1/states/#{abbr_input}/current.json")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            response = http.request(request)
            covid_state_h = JSON.parse(response.body)
            Covid.new.positive_increase_state(covid_state_h)
        

            
     
            

        
            
        end
    
    
    
    end

end
