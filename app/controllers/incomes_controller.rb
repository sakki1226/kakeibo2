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

  private

  def income_params
    params.require(:income).permit(:date, :income_category_id, :price).merge(user_id: current_user.id)
  end
end