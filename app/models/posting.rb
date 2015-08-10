class Posting < ActiveRecord::Base
  belongs_to :user
  has_attachments :photos, maximum: 10

  validates_inclusion_of :year, in: (1936..Date.today.year+1).map(&:to_s)
  validates_numericality_of :zip_code
  validates_presence_of :description, :title
  validates_inclusion_of :kind, in: ["dealer", "private"]
  validates_inclusion_of :zip_code, in: (00501..99950), message: "is not valid"

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # TODO: turn zip code into city/state info
  # TODO: "status" gets default value

  def to_param
    "#{id}-#{title.parameterize}"
  end

  # Temp. Relace with Elasticsearch
  def related
    Posting.order("RANDOM()").limit(4)
  end

end
