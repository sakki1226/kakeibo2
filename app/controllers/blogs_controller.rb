class BlogsController < ApplicationController
  before_action :set_beginning_of_week

  
  def index
    @blogs = Blog.all
    @blog = Blog.new
    family_expenses = current_user.family.users.map { |user| user.expenses }.flatten
    @expenses_by_date = family_expenses.group_by { |expense| expense.date.to_date }.transform_values { |expenses| expenses.sum(&:price) }
  end

  def show
    date_string = params[:date]
    date_parts = date_string.split('-').map(&:to_i)
    @date = Date.new(date_parts[0], date_parts[1], date_parts[2]) rescue Date.today
  
    # 現在のユーザーが所属する家族のユーザーを取得
    @family_users = current_user.family.users
    
    # 現在のユーザーが所属する家族の全てのユーザーに関連する収入と支出を日付で絞り込んで取得
    @incomes = []
    @expenses = []
    @family_users.each do |user|
      user_incomes = user.incomes.where(date: @date.beginning_of_day..@date.end_of_day)
      user_expenses = user.expenses.where(date: @date.beginning_of_day..@date.end_of_day)
      @incomes.concat(user_incomes)
      @expenses.concat(user_expenses)
    end
  end

  def expenses_by_month
    @year = params[:year].to_i
    @month = params[:month].to_i
    family = current_user.family
    family_users = family.users
    @family_users = family_users

    @total_income_by_family = 0
    @total_expense_by_family = 0

    @expenses = Expense.where(user_id: family_users.pluck(:id)).where(date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))

    family_users.each do |user|
      incomes = user.incomes.where(date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))
      expenses = user.expenses.where(date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))

      @total_income_by_family += incomes.sum(:price)
      @total_expense_by_family += expenses.sum(:price)
    end
    @total_balance_of_payment = @total_income_by_family - @total_expense_by_family
    previous_month = Date.new(@year, @month, 1) - 1.month
    @previous_month_expenses = Expense.where(date: previous_month.beginning_of_month..previous_month.end_of_month)
    @previous_month_category_totals = {}
    ExpenseCategory.where(id: 2..17).each do |category|
      total_price = @previous_month_expenses.where(expense_category_id: category.id).sum(:price)
      @previous_month_category_totals[category.id] = total_price
    end
    @previous_month_total_expense = @previous_month_expenses.sum(:price)

    @category_expense_totals = {
      "変動費" => @expenses.where(expense_category_id: 2..9).sum(:price),
      "固定費" => @expenses.where(expense_category_id: 10..16).sum(:price),
      "貯金" => @expenses.where(expense_category_id: 17).sum(:price)
    }

    current_month_variable_expense_data = {}
    (2..16).each do |category_id|
      category_name = ExpenseCategory.find(category_id).name
      expenses_for_category = @expenses.where(expense_category_id: category_id)
      current_month_variable_expense_data[category_name] = expenses_for_category.sum(:price)
    end

    @current_month_variable_expense_data = current_month_variable_expense_data

    previous_month = Date.new(@year, @month, 1) - 1.month

    previous_month_variable_expense_data = {}
    (2..16).each do |category_id|
      category_name = ExpenseCategory.find(category_id).name
      previous_month_expenses_for_category = Expense.where(expense_category_id: category_id, date: previous_month.beginning_of_month..previous_month.end_of_month)
      previous_month_variable_expense_data[category_name] = previous_month_expenses_for_category.sum(:price)
    end

    @previous_month_variable_expense_data = previous_month_variable_expense_data
  end

  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end


