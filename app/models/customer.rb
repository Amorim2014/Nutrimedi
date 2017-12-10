class Customer < ActiveRecord::Base
	# #belongs_to :user
	# #has_many :order

	# validates_presence_of :name
	# validates :cnpj_cpf, numericality: true


	# def name
 #     read_attribute(:name).try(:titleize)
 #  	end

 #  	def company_name
 #     read_attribute(:company_name).try(:titleize)
 #  	end
	
	# def customer_type_to_s
	# 	# ["Preço Loja", "0"], ["Tabela 1", "1"], ["Tabela 2", "2"]
	# 	case costumer_type
	# 	when 0
	# 		"Preço Loja"
	# 	when 1
	# 		"Tabela 1"
	# 	when 2
	# 		"Tabela 2"
	#     end
	# end
		
end
