class IncomesController < ApplicationController
  def index
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    redirect_to root_path
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to root_path
  end

  private

  def income_params
    params.require(:income).permit(:date, :income_category_id, :price).merge(user_id: current_user.id)
  end
end
