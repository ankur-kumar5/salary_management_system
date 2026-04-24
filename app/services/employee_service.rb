class EmployeeService
  def self.create(params)
    Employee.create!(params)
  end

  def self.update(id, params)
    employee = Employee.find(id)
    employee.update!(params)
    employee
  end

  def self.delete(id)
    Employee.find(id).destroy!
  end
end