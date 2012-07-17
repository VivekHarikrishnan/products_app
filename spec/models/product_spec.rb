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

require 'spec_helper'

describe Product do
  before { @product = FactoryGirl.create(:product) }

  subject { @product }

  it { should respond_to :type }
  it { should respond_to :item_id }
end
