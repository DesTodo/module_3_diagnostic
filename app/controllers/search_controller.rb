class SearchController < ApplicationController
  def index
    zipcode = params[:zipcode]

    @conn = Faraday.new(url: 'https://developer.nrel.gov/api/') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['dev_network_key']
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get('/api/alt-fuel-stations/v1')
    #{}"/api/alt-fuel-stations/v1/nearest.format?location=#{zipcode}")

    @stations = JSON.parse(response.body, symbolize_names: true)
  end
end
