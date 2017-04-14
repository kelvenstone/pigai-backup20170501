class CompositionsController < ApplicationController
before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new

  end

  def create
    @composition = Composition.new
    if @composition = Composition.save(composition_params)
      redirect_to compositions_path, alert:'one compotion input'
    else
      render :new
    end

  end

  def edit

  end

  def show
  end

  def update
  end

  def destroy
  end

  def compostion_params
    params.require(:composition).permit(:grade, :content)
  end

end
