class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname

    @year = params[:year].present? ? params[:year].to_i : Date.current.year
    @month = params[:month].present? ? params[:month].to_i : Date.current.month

    @expenses = Expense.where(user_id: current_user.id, date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1)).order(date: :asc)
    @total_expense = @expenses.sum(:price)
    @incomes = Income.where(user_id: current_user.id, date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))
    @total_income = @incomes.sum(:price)

    @month_name = Date.new(@year, @month).strftime('%Y年%m月')

    previous_month = Date.new(@year, @month, 1) - 1.month
    @previous_month_expenses = Expense.where(date: previous_month.beginning_of_month..previous_month.end_of_month)
    @previous_month_category_totals = {}
    ExpenseCategory.where(id: 2..17).each do |category|
      total_price = @previous_month_expenses.where(expense_category_id: category.id).sum(:price)
      @previous_month_category_totals[category.id] = total_price
    end
    @previous_month_total_expense = @previous_month_expenses.sum(:price)
  end
end
