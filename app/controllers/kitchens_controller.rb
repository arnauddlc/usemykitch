class KitchensController < ApplicationController
before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    @kitchens = Kitchen.all
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user_id = current_user.id
    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @kitchen.update(kitchen_params)
    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :edit
    end
  end

  def destroy
    @kitchen.destroy
    redirect_to kitchens_path
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:title, :description, :address, :picture, :price)
  end

end
