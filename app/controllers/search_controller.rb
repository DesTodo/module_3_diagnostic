class SearchController < ApplicationController
  def index
    @stations = Station.where(params[:q])
  end
end
