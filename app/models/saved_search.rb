class SavedSearch < ActiveRecord::Base
  belongs_to :user

  def title
    self.pretty_query.values.join.titleize
  end

  def pretty_query
    @pretty_query ||= Rack::Utils.parse_query(self.query).reject { |k, v| v.blank? }.reject { |k, v| k =~ /search|commit/ }
  end
end
