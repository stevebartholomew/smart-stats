require 'reports/result'

module Reports
  class Report
    attr_reader :entries

    # @param entries [Array] array of tuples containing `page` and `ip`
    #
    # @example:
    #     Reports::Report.new([
    #       ['home', '192.168.0.1']
    #     ]
    #
    def initialize(entries)
      @entries = entries
    end

    # @returns [Reports::Result] array of result objects
    def results
      sort wrapped_results parse
    end

    protected

    def parse
      raise 'implement in sub class'
    end

    def wrapped_results(results)
      results.map do |(page, count)|
        Result.new(page: page, count: count)
      end
    end

    def sort(results)
      results.sort_by(&:count).reverse
    end
  end
end
