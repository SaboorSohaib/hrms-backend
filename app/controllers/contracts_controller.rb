class ContractsController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_contract, only: %i[update]

  def index
    @contracts = @employee.contracts
    render json: @contracts
  end

  def create
    @contract = @employee.contracts.create(contract_params)
    if @contract.save
      render json: @contract, status: :created
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_contract
    @contract = @employee.contracts.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:starting_date, :ending_date, :contract_type, :employee_id)
  end
end
