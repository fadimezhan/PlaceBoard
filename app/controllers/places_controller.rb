class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :edit, :update, :destroy]
  def index
    @places = Place.all
  end

  def new
    @place = Place.build
    load_categories
  end

  def create
    @place = Place.(places_params)

    if @place.save
      redirect_to @place
    else
      load_categories
      render 'new'
    end
  end

  def show
    @place= Place.find(params[:id])
    @comment = Comment.new
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
