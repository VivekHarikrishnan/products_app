require 'spec_helper'

describe Book do

	before :each do
		@book = FactoryGirl.create(:book)
	end

	subject { @book }

  	it { should respond_to :title }

  	it { should respond_to :author }

  	it { should respond_to :description }

  	it { should respond_to :price }
end