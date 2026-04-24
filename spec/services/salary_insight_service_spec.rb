RSpec.describe SalaryInsightService do
  before do
    create(:employee, job_title: "Engineer", country: "India", salary: 100)
    create(:employee, job_title: "Engineer", country: "India", salary: 200)
  end

  it "calculates country stats correctly" do
    stats = described_class.country_stats("India")

    expect(stats[:min]).to eq(100)
    expect(stats[:max]).to eq(200)
    expect(stats[:avg].to_f).to eq(150.0)
  end

  it "returns average salary for job title in country" do
    avg = described_class.job_title_avg("India", "Engineer")
    expect(avg.to_f).to eq(150.0)
  end
end