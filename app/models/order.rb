class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates_presence_of :user


  paginates_per 25

  #Scopes search
  scope :search, -> (query) { joins(:user).where("lower(users.name) LIKE ?", "%#{query.downcase}%")}

  end
