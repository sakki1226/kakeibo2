class ExpensesController < ApplicationController
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

  private

  def expense_params
    params.require(:expense).permit(:date, :expense_category_id, :payment_method_id, :price).merge(user_id: current_user.id)
  end
end
