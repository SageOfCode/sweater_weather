class Api::V1::MunchiesController < ApplicationController
  def index
    conn = Faraday.new("http://www.mapquestapi.com") do |f|
      f.params['key'] = ENV['map_api_key']
    end
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = params[:start]
      r.params['to'] = params[:destination]
    end 
    json = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end
end 