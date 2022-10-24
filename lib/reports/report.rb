require 'reports/result'

module Reports
  class Report
    attr_reader :entries

    # @param entries [ [ page, ip ]] tuple of entries parsed from a log file
    def initialize(entries)
      @entries = entries
    end

    # @returns [Reports::Result] array of result objects
    def results
      sort parse.map {|(page, count)| Result.new(page: page, count: count) }
    end

    protected

    def parse
      raise 'implement in sub class'
    end

    def sort(results)
      results.sort_by(&:count).reverse
    end
  end
end
