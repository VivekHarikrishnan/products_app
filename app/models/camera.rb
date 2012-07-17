# == Schema Information
#
# Table name: cameras
#
#  id         :integer(4)      not null, primary key
#  model      :string(255)
#  make       :string(255)
#  price      :integer(10)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Camera < ActiveRecord::Base
  attr_accessible :make, :model, :price

  validates :make, presence: true
  validates :model, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }
  
  before_create :create_product
  after_create :save_product

  def item_list
    Product.list(self)
  end

  private

  	def create_product
  		@product = Product.new(item_id: :id, type: "Camera")
  	end

    def save_product
      @product.item_id = self.id
      @product.save
    end
end
