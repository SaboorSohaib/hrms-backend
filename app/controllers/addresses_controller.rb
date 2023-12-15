class AddressesController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_address, only: %i[update]

  def index
    @address = @employee.address
    render json: @address
  end

  def show
    @address = Address.find_by(employee_id: params[:employee_id]);
    render json: @address
  end

  def create
    @address = @employee.build_address(address_params)
    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      render json: @address, status: :ok
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_address
    @address = @employee.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:province, :distract, :employee_id)
  end
end
