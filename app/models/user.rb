class User < ActiveRecord::Base

paginates_per 25

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true, on: :update
  has_many :orders

  scope :search, -> (query) {where("lower(name) LIKE ?", "%#{query.downcase}%")}
   # def self.search(query)
   #   where("name like ?", "%#{query}%")
   # end
  

  def name
     read_attribute(:name).try(:titleize)
  end

  def costumer_type_to_s
		# ["Preço Loja", "0"], ["Tabela 1", "1"], ["Tabela 2", "2"]
		case costumer_type
		when 0
			"Preço Loja"
		when 1
			"Tabela 1"
		when 2
			"Tabela 2"
		end
	end
end