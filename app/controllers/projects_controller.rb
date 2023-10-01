class ProjectsController < ApplicationController
  before_action :authenticate_request
  before_action :ser_department
  before_action :set_project, only: %i[show update destroy]

  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def create
    @project = @department.projects.create(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def ser_department
    @department = Department.find(params[:department_id])
  end

  def set_project
    @project = @department.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :starting_date, :ending_date, :duration, :department_id)
  end
end
