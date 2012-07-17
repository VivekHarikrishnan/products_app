# == Schema Information
#
# Table name: songs
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  album      :string(255)
#  artist     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :name  

  validates :name, presence: true
  validates :album, presence: true
  validates :artist, presence: true

  before_create :create_product
  after_create :save_product

  def item_list    
    Product.list(self)
  end

  private

    def create_product
      @product = Product.new(item_id: :id, type: "Song")
    end

    def save_product
      @product.item_id = self.id
      @product.save     
    end
end
