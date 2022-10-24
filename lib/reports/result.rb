module Reports
  class Result
    attr_reader :page, :count

    def initialize(attr)
      @page = attr.fetch(:page)
      @count = attr.fetch(:count)
    end
  end
end
