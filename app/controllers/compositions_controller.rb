class CompositionsController < ApplicationController
before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new

  end

  def create
    @composition = Composition.new(composition_params)
    @composition.user = current_user

    respond_to do |format|
      if @composition.save
        format.html { redirect_to @composition, notice: 'composition was successfully created.' }
        format.json { render :show, status: :created, location: @composition }
      else
        format.html { render :new }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  def show

  end

  def update
    respond_to do |format|
      if @composition.update(composition_params)
        format.html { redirect_to @composition, notice: 'composition was successfully updated.' }
        format.json { render :show, status: :ok, location: @composition }
      else
        format.html { render :edit }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @composition.destroy
    respond_to do |format|
      format.html { redirect_to compositions_url, notice: 'composition was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def composition_params
    params.require(:composition).permit(:grade, :com_title, :content)
  end

end
