class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :postings

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  validates_length_of :password, minimum: 6
end
