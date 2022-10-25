module Reports
  class Result
    attr_reader :page, :count

    def initialize(page:, count:)
      @page = page
      @count = count
    end
  end
end
