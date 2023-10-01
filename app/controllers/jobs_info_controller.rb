class JobsInfoController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_job_info, only: %i[update destroy]

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

  def destroy
    @job_info.destroy
    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_job_info
    @job_info = JobInfo.find(params[:id])
  end

  def job_info_params
    params.require(:job_info).permit(:job_title, :employee_id)
  end
end
