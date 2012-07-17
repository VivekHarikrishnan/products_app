# == Schema Information
#
# Table name: products
#
#  id         :integer(4)      not null, primary key
#  type       :string(255)
#  item_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :type, :item_id

  validates :type, inclusion: {in: ["Book", "Camera", "Song"]}
  validates :item_id, presence: true

  default_scope order: "products.created_at DESC"

  def self.item(product)
    p product
    p product.item_id
    p product.id
    p product.type
    itemClass = item_class(product)

    item = itemClass.find(product.item_id)
  end

  def self.list(product)
  	item_list = []

    itemClass = item_class(product)
    item = itemClass.find(product.item_id)
  	columns = itemClass.columns.map {|c| c.name} # Will return ["id", "title", "author", "description", "price", "created_at", "updated_at"] for Book
    columns.reject! { |column| column =~ /id|created_at|updated_at/i }

  	columns.each_with_index do |column, index|
  		column_value = item.send(column)
      item_list << column_value  		
  	end

  	item_list.join(",")
  end

  private

    def self.item_class(product)
      eval(product.type)
    end
end
