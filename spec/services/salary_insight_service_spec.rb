RSpec.describe SalaryInsightService do
  before do
    Employee.create!(full_name: "A", job_title: "Engineer", country: "India", salary: 100)
    Employee.create!(full_name: "B", job_title: "Engineer", country: "India", salary: 200)
  end

  it "calculates country stats correctly" do
    stats = described_class.country_stats("India")

    expect(stats[:min]).to eq(100)
    expect(stats[:max]).to eq(200)
    expect(stats[:avg].to_f).to eq(150.0)
  end
end