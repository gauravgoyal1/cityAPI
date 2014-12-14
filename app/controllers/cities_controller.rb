class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    if params[:country].present?
      @cities = City.where('country ILIKE ?', params[:country]).pluck(:name)
      if @cities.present?
        respond_to do |format|
          format.html { render json: @cities, status: :ok }
          format.json { render json: @cities, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render json: ["No Data"], status: :not_found }
          format.json { render json: ["No Data"], status: :not_found }
        end
      end
    end
    if params[:city].present?
      @country = City.where('name ILIKE ?', params[:city]).pluck(:country)
      if @country.present?
        respond_to do |format|
          format.html { render json: @country, status: :ok }
          format.json { render json: @country, status: :ok }
        end
      else
        respond_to do |format|
          format.html { render json: ["No Data"], status: :not_found }
          format.json { render json: ["No Data"], status: :not_found }
        end
      end
    end
  end

end

