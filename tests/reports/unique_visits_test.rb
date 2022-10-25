require_relative '../test_helper'
require 'reports/unique_visits'

describe Reports::UniqueVisits do
  let(:log_entries) do
    [
      ['/index', '100.100.100.1'],
      ['/index', '100.100.100.1'],
      ['/about', '100.100.100.1'],
      ['/index', '100.100.100.1'],
      ['/about', '100.100.100.1'],
      ['/about', '100.100.100.2'],
      ['/index', '100.100.100.1'],
      ['/about', '100.100.100.3']
    ]
  end

  let(:report) { Reports::UniqueVisits.new(log_entries) }

  it 'has a title' do
    assert_equal 'Unique visits by page', report.title
  end

  it 'returns total visit counts, ordered' do
    (first, second) = report.results

    assert_equal '/about', first.page
    assert_equal 3, first.count

    assert_equal '/index', second.page
    assert_equal 1, second.count
  end
end
