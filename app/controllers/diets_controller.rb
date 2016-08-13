class DietsController < ApplicationController

  def index
    @diets = Diet.all
  end

  def new
    @diet = Diet.new
  end

  def create
    # URLを動的にしてparams[:id]で取れるようにする
    @diet = Diet.new(diets_params)
    @diet.user_id = params[:user_id]

    # @diet.user_id = current_user.id
    if @diet.save
      redirect_to user_diets_path
    else
      render 'new'
    end
  end

end


private

  def diets_params
    params.require(:diet).permit(:user_id, :weight, :height )
  end
