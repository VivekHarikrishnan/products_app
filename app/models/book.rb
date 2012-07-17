# == Schema Information
#
# Table name: books
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  author      :string(255)
#  description :text
#  price       :integer(10)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Book < ActiveRecord::Base
  attr_accessible :author, :description, :price, :title

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }
  
  before_create :create_product
  after_create :save_product

  def item_list
    Product.list(self)
  end

  private

    def create_product
      @product = Product.new(item_id: :id, type: "Book")
    end

    def save_product
      @product.item_id = self.id
      @product.save
    end
end
