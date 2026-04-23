class EmployeesController < ApplicationController
  def index
    render json: Employee.all
  end

  def create
    employee = EmployeeService.create(employee_params)
    render json: employee, status: :created
  end

  def update
    employee = EmployeeService.update(params[:id], employee_params)
    render json: employee
  end

  def destroy
    EmployeeService.delete(params[:id])
    head :no_content
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :job_title, :country, :salary)
  end
end