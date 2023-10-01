class SalariesController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_salary, only: %i[update destroy]

  def create
    @salary = @employee.salaries.create(salary_params)
    if @salary.save
      render json: @salary, status: :created
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def update
    if @salary.update(salary_params)
      render json: @salary, status: :ok
    else
      render json: @salary.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @salary.destroy
    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_salary
    @salary = @employee.salaries.find(params[:id])
  end

  def salary_params
    params.require(:salary).permit(:salary_amount, :month, :employee_id)
  end
end
