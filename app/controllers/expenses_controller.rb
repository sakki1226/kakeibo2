class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]


  def index
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)  
    if @expense.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to root_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to root_path
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :expense_category_id, :payment_method_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @expense = Expense.find(params[:id])
    unless current_user.id == @expense.user.id
      redirect_to root_path
    end
  end
end
