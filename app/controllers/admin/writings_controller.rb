class Admin::WritingsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @writings = Writing.all.order("created_at DESC")

  end

  def show
    @writing = Writing.find(params[:id])
    @composition = @writing.composition
  end


  def destroy

    @writing = Writing.find(params[:id])
    if @writing.corrections.count == 0
      @writing.destroy
      flash[:alert]="admin writing deleted"
      redirect_to admin_writings_path
    else
      flash[:alert]="Can not delete. Please delete the corrections of the writing."
      redirect_to admin_writings_path
    end
  end


  private
    def writing_params
      params.require(:writing).permit(:content)
    end

end
