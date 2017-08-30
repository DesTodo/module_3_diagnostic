require 'rails_helper'

RSpec.describe "homepage stations search", :type => :feature do
  describe "user searches stations by zipcode" do

    visit '/'
    find('form-control').set('80203')
    fill_in['form-control'], with:'80203'
    click_on['Locate']

    expect current_path.to eq("/search")
    expect(response).to be_success

    stations = JSON.parse(response.body, symbolize_names: true)
    station = stations.last

    expect(stations.count).to eq(10)
    expect(station.distance <= 6).to be_truthy
    expect(station.name).to be_truthy
    expect(station.address).to be_truthy
    expect(station.fuel_types).to be_truthy
    expect(station.distance).to be_truthy
    expect(station.access_times).to be_truthy
  end
end
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
