class PlacesController < ApplicationController
  before_action :authenticate_owner!, except: [:index,:show]
  before_action :find_place, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    load_categories
  end

  def create
    @place = current_owner.places.build(places_params)

    if @place.save
      flash[:success]="Successfully created!"
      redirect_to @place
    else
      load_categories
      render 'new'
    end
  end

  def show
    @place= Place.find(params[:id])
  end

  def edit
    load_categories
  end

  def update
    if @place.update(places_params)
      redirect_to @place
    else
      load_categories
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end

  private
  # giriş yapanın edit yetkisi olup olmadığını kontrol eder.
  def authorize_owner!
    redirect_to root_path, notice: "Not Authorized" unless @place.owner_id == current_owner.id
  end

  def find_place
    @place = Place.find(params[:id])
  end

  def places_params
    params.require(:place).permit(:name,:address,:astablished_at, :phone_number, :contact_mail, :city, :description, :category_id)
  end

  def load_categories
    @categories = Category.all.collect { |c| [c.title, c.id]}
  end
end
