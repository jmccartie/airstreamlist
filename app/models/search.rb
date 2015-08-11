class Search

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def results
    query = ""
    query << "title ILIKE '%#{params[:q]}%'"
    query << " #{operator} model ILIKE '%#{params[:model]}%'" if params[:model].present?
    query << " #{operator} length BETWEEN #{params[:length_start]} AND #{params[:length_end]}" if params[:length_start].present? and params[:length_end].present?
    query << " #{operator} year BETWEEN #{params[:year_start]} AND #{params[:year_end]}" if params[:year_start].present? and params[:year_end].present?
    query << " #{operator} kind = '#{params[:kind]}'" if params[:kind].present?

    ActiveRecord::Base::sanitize(query)
    items = Listing.where(query)
    if params[:sort_field].present? and params[:sort_direction].present?
      if Listing.column_names.include?(params[:sort_field].downcase)
        items = items.order("#{params[:sort_field].downcase} #{params[:sort_direction]}")
      end
    end
    items
  end

  def operator
    params[:fuzzy] == true ? 'OR' : 'AND'
  end



end