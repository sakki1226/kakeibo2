class BlogsController < ApplicationController

  
  def index
    @blogs = current_user.family.blogs
    @blog = Blog.new
    @expenses_by_date = Expense.group("DATE(date)").sum(:price)
  end

  def show
    date_string = params[:date]
    date_parts = date_string.split('-').map(&:to_i)
    formatted_date = "#{date_parts[0]}-#{date_parts[1].to_s.rjust(2, '0')}-#{date_parts[2].to_s.rjust(2, '0')}"
    @date = Date.parse(formatted_date)
    @incomes = Income.where("EXTRACT(YEAR FROM DATE(date)) = ? AND EXTRACT(MONTH FROM DATE(date)) = ? AND EXTRACT(DAY FROM DATE(date)) = ?", @date.year, @date.month, @date.day)
    @expenses = Expense.where("EXTRACT(YEAR FROM DATE(date)) = ? AND EXTRACT(MONTH FROM DATE(date)) = ? AND EXTRACT(DAY FROM DATE(date)) = ?", @date.year, @date.month, @date.day)
  end

  def expenses_by_month
    @year = params[:year].to_i
    @month = params[:month].to_i
    @expenses = Expense.where("YEAR(date) = ? AND MONTH(date) = ?", @year, @month)
    @total_expense = @expenses.sum(:price)
    @incomes = Income.where("YEAR(date) = ? AND MONTH(date) = ?", @year, @month)
    @total_income = @incomes.sum(:price)
  end

end
