class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :listings, dependent: :destroy
  has_many :saved_searches, dependent: :destroy

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }
  validates_length_of :password, minimum: 6
  validates_confirmation_of :password, message: "should match password", if: "password.present?"
end
