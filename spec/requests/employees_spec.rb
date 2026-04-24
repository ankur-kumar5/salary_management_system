RSpec.describe "Employees API", type: :request do
  it "creates employee" do
    post "/employees", params: {
      employee: {
        full_name: "John",
        job_title: "Engineer",
        country: "India",
        salary: 50000
      }
    }

    expect(response).to have_http_status(:created)
  end

  it "deletes employee" do
    employee = create(:employee)

    delete "/employees/#{employee.id}"

    expect(response).to have_http_status(:no_content)
  end
end