class Category < ActiveRecord::Base
	has_many :products
	validates :name, presence: true,
					length: { minimum: 5 }
end
