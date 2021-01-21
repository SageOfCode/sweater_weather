require 'rails_helper'
describe 'Munchie' do
  it 'exists and has attributes' do
    city = "boulder,co"
    distance = {
      :route=>{
        :hasTollRoad=>false,
        :hasBridge=>true,
        :boundingBox=>{:lr=>{:lng=>-104.605087, :lat=>38.265427}, :ul=>{:lng=>-104.98761, :lat=>39.738453}},
        :distance=>111.38,
        :hasTimedRestriction=>false,
        :hasTunnel=>false,
        :hasHighway=>true,
        :computedWaypoints=>[],
        :routeError=>{:errorCode=>-400, :message=>""},
        :formattedTime=>"01:44:22",
        :sessionId=>"6008f227-0263-5f21-02b4-33eb-06290d9a47e5",
        :hasAccessRestriction=>false,
        :realTime=>6507,
        :hasSeasonalClosure=>false,
        :hasCountryCross=>false,
        :fuelUsed=>5.5
      }
    }
    forecast = {
      :lat=>38.2654,
      :lon=>-104.6051,
      :timezone=>"America/Denver",
      :timezone_offset=>-25200,
      :current=>
        {:dt=>1611199015,
        :sunrise=>1611151888,
        :sunset=>1611187637,
        :temp=>42.46,
        :feels_like=>28.69,
        :pressure=>1014,
        :humidity=>34,
        :dew_point=>17.85,
        :uvi=>0,
        :clouds=>1,
        :visibility=>10000,
        :wind_speed=>14.97,
        :wind_deg=>280,
        :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}
    }
    food = {
      :businesses=>
        [{:id=>"kQxM1xlaZfQmXpKaqMTNnw",
          :alias=>"wonderful-bistro-pueblo",
          :name=>"Wonderful Bistro",
          :image_url=>"https://s3-media1.fl.yelpcdn.com/bphoto/EIPRzs68vSrQ_2tCf5pQNw/o.jpg",
          :is_closed=>false,
          :url=>
          "https://www.yelp.com/biz/wonderful-bistro-pueblo?adjust_creative=wSqNjyvd1Y1HmcN8kPANOA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=wSqNjyvd1Y1HmcN8kPANOA",
          :review_count=>64,
          :categories=>[{:alias=>"chinese", :title=>"Chinese"}],
          :rating=>4.0,
          :coordinates=>{:latitude=>38.319366, :longitude=>-104.616623},
          :transactions=>["delivery"],
          :price=>"$$",
          :location=>
          {:address1=>"4602 N Elizabeth St",
            :address2=>"Ste 120",
            :address3=>"",
            :city=>"Pueblo",
            :zip_code=>"81008",
            :country=>"US",
            :state=>"CO",
            :display_address=>["4602 N Elizabeth St", "Ste 120", "Pueblo, CO 81008"]},
          :phone=>"+17195440233",
          :display_phone=>"(719) 544-0233",
          :distance=>6632.28027227077}],
      :total=>1,
      :region=>{:center=>{:longitude=>-104.5733642578125, :latitude=>38.27035217485165}}}
    
    munchie = Munchie.new(city, distance, forecast, food)
  
    expect(munchie).to be_a(Munchie)
    expect(munchie.destination_city).to eq(city.gsub(",", ", ").capitalize)
    expect(munchie.travel_time).to eq(distance[:route][:formattedTime])
    expect(munchie.forecast).to eq({
      summary: forecast[:current][:weather][0][:description],
      temperature: forecast[:current][:temp].to_s
    })
    expect(munchie.restaurant).to eq({
      name: food[:businesses][0][:name],
      address: food[:businesses][0][:location][:display_address].join(" ")
    })
  end
end 