class Posting < ActiveRecord::Base
  belongs_to :user

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def title
    "#{year} #{model} #{length}' – #{state}"
  end

  def featured_image
    "http://placehold.it/350x250"
  end

  def kind
    dealer? ? "Dealer" : "Private party"
  end
end
