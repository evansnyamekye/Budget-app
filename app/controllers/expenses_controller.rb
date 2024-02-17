class ExpensesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.author = current_user

    category_id = params[:expense][:category_id]

    if category_id.present?
      category = Category.find(category_id)
      @expense.categories << category
    end

    respond_to do |format|
      if @expense.save!
        format.html do
          redirect_to category_expenses_path(category_id), notice: 'Transaction created successfully!'
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, flash: { error: 'Transaction not created!' } }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
