# frozen_string_literal: true

require 'rails_helper'
require_relative '../../lib/class/payslip'

RSpec.describe Payslip do
  # let uses lazy-loading, a new payslip object will be created when it is needed
  let(:payslip1) { described_class.new('Ren', 60_000) }
  let(:payslip2) { described_class.new('Ren', 200_000) }
  let(:payslip3) { described_class.new('Ren', 80_150) }

  it 'has an individual\'s name' do
    expect(payslip1.employee_name).to eq('Ren')
  end

  it 'has an individual\'s annual salary' do
    expect(payslip1.annual_salary).to eq(60_000)
  end

  it 'has an individual\'s total tax' do
    expect(payslip1.calculate_tax).to eq(6000)
    expect(payslip2.calculate_tax).to eq(48_000)
    expect(payslip3.calculate_tax).to eq(10_045)
  end

  it 'has an individual\'s monthly tax' do
    expect(payslip1.calculate_monthly_income_tax).to eq(500)
  end

  it 'has an individual\'s gross monthly income' do
    expect(payslip1.calculate_gross_monthly_income).to eq(5000)
  end

  it 'has an individual\'s net monthly income' do
    expect(payslip1.calculate_net_monthly_income).to eq(4500)
  end
end
