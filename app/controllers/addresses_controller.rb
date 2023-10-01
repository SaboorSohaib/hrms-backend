class AddressesController < ApplicationController
  before_action :authenticate_request
  before_action :set_employee
  before_action :set_address, only: %i[update destroy]

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

  def destroy
    @address.destroy
    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:province, :distract, :employee_id)
  end
end
