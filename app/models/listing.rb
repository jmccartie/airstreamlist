class Listing < ActiveRecord::Base
  belongs_to :user
  has_attachments :photos, maximum: 15

  validates_inclusion_of :year, in: (1936..Date.today.year+1)
  validates_numericality_of :price
  validates_presence_of :description, :title, :city, :state
  validates_inclusion_of :kind, in: ["dealer", "private"]
  validates_inclusion_of :status, in: ['open', 'archived', 'pending']

  geocoded_by :address

  after_validation :geocode, :reverse_geocode
  before_validation :set_status
  after_initialize :set_phone

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def related
    Search.new({q: self.title}).results
  end

  def address
    [city, state].compact.join(', ')
  end

  private
    def set_status
      self.status ||= 'open'
    end

    def set_phone
      self.phone ||= self.user.try(:phone)
    end

end
