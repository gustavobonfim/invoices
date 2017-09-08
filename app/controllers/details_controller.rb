class DetailsController < ApplicationController

  # def new
  #   @detail = current_user.create_detail
  # end
  #
  # def create
  #   @detail = current_user.build_detail(detail_params)
  #   if @detail.save
  #     redirect_to root_path
  #   else
  #     render 'new'
  #   end
  # end

  def edit
    @detail = Detail.find(params[:id])

  end

  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @detail = current_user.detail
  end

  private

  def detail_params
    params.require(:detail).permit(:name, :birth_date, :user_id)
  end
end
