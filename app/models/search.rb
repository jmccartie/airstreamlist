class Search

  attr_accessor :params

  # q
  # model
  # length
  # distance
  # year
  # kind
  # sort_field
  def initialize(params)
    @params = params
  end

  # TODO
  def results
    query = ""
    query << "title ILIKE '%#{params[:q]}%'"
    query << " AND model ILIKE '%#{params[:model]}%'" if params[:model].present?
    query << " AND length BETWEEN #{params[:length_start]} AND #{params[:length_end]}" if params[:length_start].present? and params[:length_end].present?
    query << " AND year BETWEEN #{params[:year_start]} AND #{params[:year_end]}" if params[:year_start].present? and params[:year_end].present?
    query << " AND kind = '#{params[:kind]}'" if params[:kind].present?

    ActiveRecord::Base::sanitize(query)
    items = Posting.where(query)
    if params[:sort_field].present? and params[:sort_direction].present?
      if Posting.column_names.include?(params[:sort_field].downcase)
        items = items.order("#{params[:sort_field].downcase} #{params[:sort_direction]}")
      end
    end
    items
  end



end