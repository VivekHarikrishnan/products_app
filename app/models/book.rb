class Book < ActiveRecord::Base
  attr_accessible :author, :description, :price, :title
end
