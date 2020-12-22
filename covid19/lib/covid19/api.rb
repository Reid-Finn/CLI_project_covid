class API
    
    def api_state
            url = URI("https://api.covidtracking.com/v1/states/current.json")
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            request = Net::HTTP::Get.new(url)
            response = http.request(request)
            covid_state = JSON.parse(response.body)
            covid_state.each do |hash|
                State.new(name = hash["state"], positive = hash["positiveIncrease"], deaths = hash["death"], hospitalized_currently = hash["hospitalizedCurrently"])
        end
    end
end
