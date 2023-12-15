class JobInfosController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_job_info, only: %i[update]

  def index
    @job_info = @employee.job_info
    render json: @job_info
  end

  def create
    @job_info = @employee.build_job_info(job_info_params)
    if @job_info.save
      render json: @job_info, status: :created
    else
      render json: @job_info.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job_info.update(job_info_params)
      render json: @job_info, status: :ok
    else
      render json: @job_info.errors, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_job_info
    @job_info = @employee.find(params[:id])
  end

  def job_info_params
    params.require(:job_info).permit(:job_title, :employee_id)
  end
end
