class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  DEFAULT_PER_PAGE = 20
  MAX_PER_PAGE = 100

  def index
    per_page = sanitized_per_page(params[:per_page])
    page = params[:page] || 1

    employees = Employee
                  .order(created_at: :desc)
                  .paginate(page: page, per_page: per_page)

    render json: {
      data: employees,
      meta: pagination_meta(employees)
    }
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

  def sanitized_per_page(per_page)
    return DEFAULT_PER_PAGE if per_page.blank?

    [per_page.to_i, MAX_PER_PAGE].min
  end

  def pagination_meta(collection)
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      prev_page: collection.previous_page,
      total_pages: collection.total_pages,
      total_count: collection.total_entries
    }
  end
end