class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    if params[:country].present?
      @cities = City.where('country ILIKE ?', params[:country]).pluck(:name)
      if @cities.present?
        respond_to do |format|
          format.html { render json: @cities, status: :found }
          format.json { render json: @cities, status: :found }
        end
      else
        respond_to do |format|
          format.html { render json: ["Error"], status: :error }
          format.json { render json: ["Error"], status: :error }
        end
      end
    end
    if params[:city].present?
      @country = City.where('name ILIKE ?', params[:city]).pluck(:country)
      if @country.present?
        respond_to do |format|
          format.html { render json: @country, status: :found }
          format.json { render json: @country, status: :found }
        end
      else
        respond_to do |format|
          format.html { render json: ["Error"], status: :error }
          format.json { render json: ["Error"], status: :error }
        end
      end
    end
  end

end

