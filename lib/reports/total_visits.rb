require 'reports/report'

module Reports
  class TotalVisits < Report
    def title
      'Total visits by page'
    end

    private

    def parse
      entries.each_with_object({}) do |(page), acc|
        acc[page] ||= 0
        acc[page] += 1
        acc
      end
    end
  end
end
