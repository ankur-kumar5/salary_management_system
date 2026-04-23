class InsightsController < ApplicationController
  def country
    render json: SalaryInsightService.country_stats(params[:country])
  end

  def job_title
    avg = SalaryInsightService.job_title_avg(params[:country], params[:job_title])
    render json: { average_salary: avg }
  end
end