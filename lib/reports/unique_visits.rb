require 'set'
require 'reports/report'

module Reports
  class UniqueVisits < Report
    def title
      'Unique visits by page'
    end

    private

    def parse
      summarized unique_visits
    end

    def unique_visits
      entries.reduce({}) do |acc, (page, ip)|
        acc[page] ||= Set.new
        acc[page].add(ip)
        acc
      end
    end

    def summarized(visits)
      visits.reduce({}) do |acc, (page, ips)|
        acc[page] ||= ips.size
        acc
      end
    end
  end
end
