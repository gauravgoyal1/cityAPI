class CitiesController < ApplicationController

  def index
    if params[:country].present?
      @cities = City.where('country ILIKE ?', params[:country]).order('name ASC').uniq.pluck(:name)
      if @cities.present?
        respond_to do |format|
          format.html { render json: @cities, status: :ok }
          format.json { render json: @cities, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render json: ["No Data"], status: :ok }
          format.json { render json: ["No Data"], status: :ok }
        end
      end
    end

    if params[:city].present?
      @country = City.where('name ILIKE ?', params[:city]).order('country ASC').pluck(:country)
      if @country.present?
        respond_to do |format|
          format.html { render json: @country, status: :ok }
          format.json { render json: @country, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render json: ["No Data"], status: :ok }
          format.json { render json: ["No Data"], status: :ok }
        end
      end
    end

    if params[:countries].present?
      @countries = City.uniq.order('country ASC').pluck(:country)
      if @countries.present?
        respond_to do |format|
          format.html { render json: @countries, status: :ok }
          format.json { render json: @countries, status: :ok }
        end
      end
    end

  end

end

