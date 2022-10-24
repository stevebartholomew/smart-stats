require_relative '../test_helper'
require 'reports/total_visits'

describe Reports::TotalVisits do
  let(:log_entries) do
    [
      ['/about', '100.100.100.1'],
      ['/index', '100.100.100.1'],
      ['/about', '100.100.100.1'],
      ['/index', '100.100.100.2'],
      ['/index', '100.100.100.2']
    ]
  end

  let(:report) { Reports::TotalVisits.new(log_entries) }

  it 'has a title' do
    assert_equal 'Total visits by page', report.title
  end

  it 'returns total visit counts, ordered' do
    result = report.results.first

    assert_equal '/index', result.page
    assert_equal 3, result.count
  end
end
