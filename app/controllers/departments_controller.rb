class DepartmentsController < ApplicationController
  before_action :authenticate_request

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    @department = Department.find(params[:id])
    render json: @department
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department, status: :created
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      render json: @department, status: :ok
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    head :no_content
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
