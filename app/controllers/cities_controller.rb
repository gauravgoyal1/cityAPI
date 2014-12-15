class CitiesController < ApplicationController

  def index
    if params[:countries].present?
      countries = City.uniq.order('country ASC').pluck(:country)
      if countries.present?
        @json_data = {}
        @json_data[:countries_count] = countries.count
        @json_data[:countries] = countries
        respond_to do |format|
          format.html { render json: @json_data, status: :ok }
          format.json { render json: @json_data, status: :ok }
        end
      end
    end
    
    if params[:country].present?
      cities = City.where('country ILIKE ? AND name IS NOT NULL', params[:country]).order('name ASC').uniq.pluck(:name)
      if cities.present?
        @json_data = {}
        @json_data[:country] = params[:country]
        @json_data[:cities_count] = cities.count
        @json_data[:cities] = cities
      else
        @json_data = {}
        @json_data[:country] = params[:country]
        @json_data[:cities_count] = 0
        @json_data[:cities] = ["No Data"]
      end
      respond_to do |format|
        format.html { render json: @json_data, status: :ok }
        format.json { render json: @json_data, status: :ok }
      end
    end

    if params[:city].present?
      country = City.where('name ILIKE ?', params[:city]).order('country ASC').uniq.pluck(:country)
      if country.present?
        @json_data = {}
        @json_data[:city] = params[:city]
        @json_data[:countries_count] = country.count
        @json_data[:countries] = country
      else
        @json_data = {}
        @json_data[:city] = params[:city]
        @json_data[:countries_count] = 0
        @json_data[:cities] = ["No Data"]
      end
      respond_to do |format|
        format.html { render json: @json_data, status: :ok }
        format.json { render json: @json_data, status: :ok }
      end
    end

  end

end

