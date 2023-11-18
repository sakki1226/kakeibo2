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

    @total_income_by_family = 0
    @total_expense_by_family = 0

    @expenses = Expense.where(user_id: family_users.pluck(:id)).where(date: Date.new(@year, @month, 1)..Date.new(@year, @month, -1))

    # 各家族の収入と支出を計算
    family_users.each do |user|
      incomes = user.incomes.where("YEAR(date) = ? AND MONTH(date) = ?", @year, @month)
      expenses = user.expenses.where("YEAR(date) = ? AND MONTH(date) = ?", @year, @month)

      @total_income_by_family += incomes.sum(:price)
      @total_expense_by_family += expenses.sum(:price)
    end
  end

  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end


