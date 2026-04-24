require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is valid with valid attributes" do
    employee = Employee.new(
      full_name: "John Doe",
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )
    expect(employee).to be_valid
  end

  it "is invalid without salary" do
    employee = Employee.new(salary: nil)
    expect(employee).not_to be_valid
  end
end