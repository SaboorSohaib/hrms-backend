class AttendancesController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_attendance, only: %i[update destroy]

  def index
    @attendances = @employee.attendances.all
    render json: @attendances, status: :ok
  end

  def create
    @attendance = @employee.attendances.create(attendance_params)
    if @attendance.save
      render json: @attendance, status: :created
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      render json: @attendance, status: :ok
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance.destroy
    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_attendance
    @attendance = @employee.attendances.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :clock_in, :clock_out, :employee_id)
  end
end
