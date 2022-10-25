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
      entries.each_with_object({}) do |(page, ip), acc|
        acc[page] ||= Set.new
        acc[page].add(ip)
        acc
      end
    end

    def summarized(visits)
      visits.each_with_object({}) do |(page, ips), acc|
        acc[page] ||= ips.size
        acc
      end
    end
  end
end
