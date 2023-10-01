class ReportsController < ApplicationController
  before_action :authenticate_request
  before_action :set_department
  before_action :set_report, only: %i[show update destroy]

  def index
    @reports = Report.all
    render json: @reports, status: :ok
  end

  def show
    render json: @report, status: :ok
  end

  def create
    @report = @department.reports.create(report_params)
    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      render json: @report, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
    head :no_content
  end

  private

  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_report
    @report = @department.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:name, :description, :department_id)
  end
end
