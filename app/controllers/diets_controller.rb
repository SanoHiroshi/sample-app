class DietsController < ApplicationController

  def index
    @diets = Diet.all
    # @diets = Diet.where(user_id: current_user.id)
    #   p @diets
    @diets.each do |t|
      # p @diets
      @graph = t.created_at, t.weight
    end
  end

  def new
    @diet = Diet.new
  end

  def create
    # URLを動的にしてparams[:id]で取れるようにする
    user = User.find(params[:id])

    @diet = Diet.new(diets_params)
    # @diet.user_id = user.id

    # @diet.user_id = current_user.id
    if @diet.save
      redirect_to diets_path
    else
      render 'new'
    end
  end

end


private

  def diets_params
    params.require(:diet).permit(:user_id, :weight, :height )
  end
