class Admin::ItemsController < ApplicationController
  before_action :set_genres, only: [:new, :create, :edit, :update]
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to admin_item_path(@item.id)
    else
       render :new
    end
  end
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :tax_exclude_price, :is_active)
  end
  
  def set_genres
    @genres = Genre.all
  end
end
