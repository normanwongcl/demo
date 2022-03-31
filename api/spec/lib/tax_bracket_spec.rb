# frozen_string_literal: true

require 'rails_helper'
require_relative '../../lib/class/tax_bracket'

RSpec.describe TaxBracket do
  # let uses lazy-loading, a new payslip object will be created when it is needed
  let(:taxbracket) { described_class.new(0, 60_000, 0.2) }

  it 'has a starting amount in the tax bracket' do
    expect(taxbracket.interval_start).to eq(0)
  end

  it 'has an ending amount in the tax bracket' do
    expect(taxbracket.interval_end).to eq(60_000)
  end

  it 'has the taxable percentage for the tax bracket' do
    expect(taxbracket.percentage).to eq(0.20)
  end
end
