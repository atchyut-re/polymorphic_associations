class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to business_path(@business)
    else
      render new
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes
      redirect_to business_path(@business)
    else
      render edit
    end
  end

  def destroy
    @business = Business.find(params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:name)
  end
end
