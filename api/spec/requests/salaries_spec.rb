# frozen_string_literal: true

require 'rails_helper'

# Following the following tutorial to test the API:
# https://youtu.be/u7TglqnXbDw
RSpec.describe 'Salaries API', type: :request do
  describe 'GET /salaries' do
    it 'return all salaries' do
      # Create 2 salaries in the test database
      FactoryBot.create(:salary, employee_name: 'Ren', annual_salary: '60000')
      FactoryBot.create(:salary, employee_name: 'John', annual_salary: '133300')

      get '/api/v1/salaries'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /salaries' do
    it 'create a new payslip' do
      expect {
        post '/api/v1/salaries', params: {salary: {name: 'Ren', annual_amount: '60000'}}
      }.to change(Salary, :count).by(1) # Check to see if Salary.count increased from 0 to 1
      
      expect(response).to have_http_status(:created)
    end
  end
end
