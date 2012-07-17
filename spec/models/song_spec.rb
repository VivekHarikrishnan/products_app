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

require 'spec_helper'

describe Song do
  before { @song = FactoryGirl.create(:song) }

  it "should respond to name" do
  	@song.should respond_to :name
  end

  it "should respond to album" do
  	@song.should respond_to :album
  end

  it "should respond to artist" do
  	@song.should respond_to :artist
  end

  it "should respond to artist" do
    @song.should respond_to :product
  end

  describe "validations" do

    it "should be invalid if name is blank" do
      song = Song.create(name: "", album: "Album", artist: "Artist")
      song.errors.should_not be_blank
    end

    it "should be invalid if album is blank" do
      song = Song.create(name: "", album: "", artist: "Artist")
      song.errors.should_not be_blank
    end

    it "should be invalid if artist is blank" do
      song = Song.create(name: "Name", album: "Album", artist: "")
      song.errors.should_not be_blank
    end

  end

  it "should save entries in Product after it is saved" do
    Product.find_by_item_id_and_type(@song.id, "Song").should_not be_nil
  end
end
