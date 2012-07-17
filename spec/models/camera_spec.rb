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

require 'spec_helper'

describe Camera do
  before { @camera = FactoryGirl.create(:camera) }

  subject { @camera }

  it { should respond_to :model }
  it { should respond_to :make }
  it { should respond_to :price }
  it { should respond_to :product }

  describe "validations" do

  	it "should be invalid if make is blank" do
  		camera = Camera.create(make: "", model: "Model name", price: 10.0)
  		camera.errors.should_not be_blank
  	end

  	it "should be invalid if model is blank" do
  		camera = Camera.create(model: "", make: "Maker", price: 10.0)
  		camera.errors.should_not be_blank
  	end

  	it "should be invalid if price is blank" do
  		camera = Camera.create(price: "", make: "Maker", model: "Model name")
  		camera.errors.should_not be_blank
  	end

    it "should be invalid if price is not a number" do
      camera = Camera.create(price: "!", make: "Maker", model: "Model name")
      camera.should_not be_valid
      camera.errors.should_not be_blank
      camera.errors.full_messages[0].should == 'Price is not a number'
    end


    it "should be invalid if price is less than or equal to 0.0" do
      camera = Camera.create(price: -10, make: "Maker", model: "Model name")
      camera.should_not be_valid
      camera.errors.should_not be_blank
      camera.errors.full_messages[0].should == 'Price must be greater than 0.0'
    end
  end

  it "should save entries in Product after it is saved" do
    Product.find_by_item_id_and_type(@camera.id, "Camera").should_not be_nil
  end
end
