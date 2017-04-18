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
    @writing.destroy
    flash[:alert]="writing deleted"
    redirect_to account_writings_path
  end


  private
    def writing_params
      params.require(:writing).permit(:content)
    end

end
