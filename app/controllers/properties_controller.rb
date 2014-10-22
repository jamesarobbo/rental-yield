class PropertiesController < ApplicationController

  def new

    @property = Property.new
  	
  end

  def create

    @property = Property.new(property_params)

    if @property.save

      redirect_to property_path(@property)

    else

      render "new"

    end
    
  end

  def show

    @property = Property.find(params[:id])

  end

  def other_properties

    @property = Property.find(params[:id])

    @response = HTTParty.get("http://api.nestoria.co.uk/api?place_name=#{@property.postal_code}&action=search_listings&pretty=1&encoding=json&listing_type=rent&country=uk")

    @data = @response['response']['listings']

    respond_to do |format|

      format.js
    end  
      
  end  

  def property_params

    params.require(:property).permit(:email, :phone_number, :postal_code, :property_price, :property_rent)
    
  end


end
