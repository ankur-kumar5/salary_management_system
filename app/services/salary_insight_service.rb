class SalaryInsightService
  def self.country_stats(country)
    employees = Employee.where("LOWER(country) = ?", country.to_s.downcase)

    {
      min: employees.minimum(:salary),
      max: employees.maximum(:salary),
      avg: employees.average(:salary)
    }
  end

  def self.job_title_avg(country, job_title)
    Employee.where("LOWER(country) = ? AND LOWER(job_title) = ?", country.to_s.downcase, job_title.to_s.downcase).average(:salary).round(2)
  end
end