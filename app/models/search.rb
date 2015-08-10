class Search

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  # TODO
  def results
    Posting.order("RANDOM()").limit(4)
  end

end