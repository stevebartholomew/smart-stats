require 'reports/report'

module Reports
  class TotalVisits < Report
    def title
      'Total visits by page'
    end

    private

    def parse
      entries.reduce({}) do |acc, (page)|
        acc[page] ||= 0
        acc[page] += 1
        acc
      end
    end
  end
end
