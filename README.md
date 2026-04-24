# Salary Management System

This is a simple salary management system built with Ruby on Rails. It allows you to manage employee records and provides insights into salary data.
## Features
- Create, read, update, and delete employee records
- View salary insights by country and job title
## Setup Instructions
1. Clone the repository:
```bash
git clone <repository-url>
```
2. Navigate to the project directory:
```bash
cd salary_management_system
```
3. Install dependencies:
```bash
bundle install
```
4. Set up the database:
```bash
rails db:create
rails db:migrate
```
5. (Optional) Seed the database with sample data:
```bash
rails db:seed
```
6. Start the Rails server:
```bash
rails server
```
7. Access the application at `http://localhost:3000`.
## Running Tests
To run the test suite, use the following command:
```bash
bundle exec rspec
```
## API Endpoints
- `GET /employees`: List all employees (supports pagination)
- `POST /employees`: Create a new employee
- `GET /employees/:id`: Get details of a specific employee
- `PUT /employees/:id`: Update an existing employee
- `DELETE /employees/:id`: Delete an employee
## Salary Insights
- `GET /salary_insights/country/:country`: Get salary statistics for a specific country
- `GET /salary_insights/job_title/:country/:job_title`: Get average salary for a specific job title in a country