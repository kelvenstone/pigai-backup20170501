class CompositionsController < ApplicationController
before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new

  end

  def create
    @composition = Composition.new(composition_params)
    @composition.user = current_user
    if @composition.save
      redirect_to compositions_path, notice:'one compotion input'
    else
      render :new
    end

  end

  def edit
    @composition = Composition.find(params[:id])
  end

  def show
    @composition = Composition.find(params[:id])
  end

  def update
    @composition = Composition.find(params[:id])
    if @composition.update(composition_params)
      redirect_to compositions_path, notice:'composition update success'
    else
      render :edit
    end
  end

  def destroy
    @composition = Composition.find(params[:id])
    @composition.destroy
      redirect_to compositions_path, alert:'composition delete'
    
  end

  private

  def composition_params
    params.require(:composition).permit(:grade, :com_title, :content)
  end

end
