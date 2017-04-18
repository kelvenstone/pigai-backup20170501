class Account::WritingsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  layout "side_grade"
  def index
    @writings = current_user.writings.order("created_at DESC")
  end

  def show
    @writing = Writing.find(params[:id])
    @composition = @writing.composition
  end

  def edit
    @writing = Writing.find(params[:id])
    @composition = @writing.composition
  end

  def update
    @writing = Writing.find(params[:id])
    if @writing.update(writing_params)
      redirect_to account_writings_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @writing = Writing.find(params[:id])
    @writing.destroy
    flash[:alert]="writing deleted"
    redirect_to account_writings_path
  end


  private
    def writing_params
      params.require(:writing).permit(:content)
    end

end
