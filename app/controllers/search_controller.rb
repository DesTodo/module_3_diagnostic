class SearchController < ApplicationController
  def index
    zipcode = params[:zipcode]

    @conn = Faraday.new(url: 'https://developer.nrel.gov/api/') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['dev_network_key']
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=2")

    @stations = JSON.parse(response.body, symbolize_names: true)
  end
end
