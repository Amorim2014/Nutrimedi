class Product < ActiveRecord::Base
  validates :name, presence: true

  paginates_per 25

  #Scopes search
  scope :search, -> (query) {where("lower(name) LIKE ?", "%#{query.downcase}%")}

    
  	def get_price(costumer_type)
    		if costumer_type == 0
      		store_price
    		elsif costumer_type == 1
      		price_one
    		elsif costumer_type == 2
      		price_two
    		end
  	end

    def name
       read_attribute(:name).try(:titleize)
    end
  end
