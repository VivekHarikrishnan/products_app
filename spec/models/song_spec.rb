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

end
