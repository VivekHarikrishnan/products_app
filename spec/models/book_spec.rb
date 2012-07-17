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

    it { should respond_to :product }

  	describe "when title is blank" do
  		subject {Book.create(title: "", author: "Author", description: "description", price: 10.0)}

  		it {should_not be_valid}
  	end

  	describe "when author is blank" do
  		subject {Book.create(author: "", title: "Title", description: "description", price: 10.0)}

  		it {should_not be_valid}
  	end

  	describe "when description is blank" do
  		subject {Book.create(description: "", title: "Title", author: "Author", price: 10.0)}

  		it {should_not be_valid}
  	end

  	describe "when price is blank" do
  		subject {Book.create(price: "", title: "Title", author: "Author", description: "description")}

  		it {should_not be_valid}
  	end
  	  	  	
  	describe "when title is already taken" do
  		before do 
  			@book_with_same_title = @book.dup
  			@book_with_same_title.save
  		end

  		subject { @book_with_same_title }
  		it {should_not be_valid}
  	end

    it "should be invalid when price is not a decimal" do
      sample_book = @book.dup
      sample_book.title = "Sample Title"
      sample_book.price = "as"
      sample_book.save.should be_false
      sample_book.errors.should_not be_blank
      sample_book.errors.full_messages[0].should == "Price is not a number"
    end

    it "should be invalid when price is less than 0.0" do
      sample_book = @book.dup
      sample_book.title = "Sample Title"
      sample_book.price = -10.0
      sample_book.save.should be_false
      sample_book.errors.should_not be_blank
      sample_book.errors.full_messages[0].should == "Price must be greater than 0.0"
    end

    it "should save entries in Product after it is saved" do
      Product.find_by_item_id_and_type(@book.id, "Book").should_not be_nil
    end
end
