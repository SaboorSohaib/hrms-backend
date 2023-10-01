class EmployeesController < ApplicationController
  before_action :authenticate_request
  before_action :set_user
  before_action :set_employee, only: %i[show update destroy]

  def index
    @employees = @user.employees.all
    render json: @employees
  end

  def show
    render json: @employee
  end

  def create
    @employee = @user.employees.create(employee_params)
    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee, status: :ok
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_employee
    @employee = @user.employees.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :phone, :gender, :photo,
                                     :hire_date, :department_id, :user_id)
  end
end
