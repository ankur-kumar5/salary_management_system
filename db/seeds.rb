# db/seeds.rb

first_names = File.readlines("db/first_names.txt").map(&:strip)
last_names  = File.readlines("db/last_names.txt").map(&:strip)

countries = ["India", "USA", "UK", "Germany"]
job_titles = ["Engineer", "Manager", "HR", "Analyst"]

employees = []

10000.times do
  employees << {
    full_name: "#{first_names.sample} #{last_names.sample}",
    job_title: job_titles.sample,
    country: countries.sample,
    salary: rand(30000..150000),
    created_at: Time.now,
    updated_at: Time.now
  }
end

Employee.insert_all(employees) # Fast bulk insert
Rails.logger.info "Seeded #{employees.size} employees"