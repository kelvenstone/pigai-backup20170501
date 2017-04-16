class WritingsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def new
    @composition = Composition.find(params[:composition_id])
    @writing = Writing.new
  end

  def create
    @composition = Composition.find(params[:composition_id])
    @writing = Writing.new(writing_params)
    @writing.composition = @composition
    @writing.user = current_user
    respond_to do |format|
      if @writing.save
        format.html { redirect_to [@composition, @writing], notice: 'writing was successfully created.' }
        format.json { render :show, status: :created, location: @writing }
      else
        format.html { render :new }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @composition = Composition.find(params[:composition_id])
    @writing = Writing.find(params[:id])

  end

  def edit
    @composition = Composition.find(params[:composition_id])
    @writing = Writing.find(params[:id])
  end

  def desroty
    @writing = Writing.find(params[:id])
    @writing.destroy
    flash[:alert]="writing deleted"
    redirect_to compositions_path

  end

  private
    def writing_params
      params.require(:writing).permit(:content)
    end

end
