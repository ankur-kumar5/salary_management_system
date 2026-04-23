class SalaryInsightService
  def self.country_stats(country)
    employees = Employee.where(country: country)

    {
      min: employees.minimum(:salary),
      max: employees.maximum(:salary),
      avg: employees.average(:salary)
    }
  end

  def self.job_title_avg(country, job_title)
    Employee.where(country: country, job_title: job_title).average(:salary)
  end
end