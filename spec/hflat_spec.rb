require "#{File.dirname(__FILE__)}/spec_helper"

describe "Core tests" do

  before(:all) do
    @hash_1 = {:key1 => {:key2 => "value2", :key3 => "value3"} }
    @hash_2 = {:key1 => {:key2 => "value2", :key1 => "value3"} }
    @flat_hash = { 1 => 1, 2 => 2, 3 => 3}
    @mix_hash = { :key1 => 1, :key2 => {:key4 => 4, :key5 => { :key6 => 6 } } , :key3 => 3 }
    @hash_3 = { :key1 => 1, :key2 => {:key4 => 4, :key5 => { } } , :key3 => nil }
  end

  describe "Testing Hash 1 - 1 level of nested hashes" do
    it "should return only key/values 2 and 3" do
      @hash_1.flatten.should == {:key2 => "value2", :key3 => "value3"}
    end

    it "should contain two key/value pairs" do
      @hash_1.flatten.size.should == 2
    end
  end

  describe "Testing hash 2 - having key repetition in nested hashes" do
    it "should return only key/values 2 and 3" do
      @hash_2.flatten.should == {:key2 => "value2", :key1 => "value3"}
    end

    it "should contain two key/value pairs" do
      @hash_2.flatten.size.should == 2
    end
  end

  describe "Testing trivial cases" do
    it "should return an empty hash" do
      {}.flatten.should == {}
    end
    it "should return itself" do
      @flat_hash.flatten.should == @flat_hash
    end
  end

  describe "Testing a mixed hash" do
    it "should only return key/value pares 1, 3, 4 and 6" do
      @mix_hash.flatten.should == { :key1 => 1, :key4 => 4, :key6 => 6, :key3 => 3 }
    end

    it "should contain exactly 4 elements" do
      @mix_hash.flatten.size.should == 4
    end
  end

  describe "Testing Hash 3" do
    it "should contain exactly 3 elements" do
      @hash_3.flatten.size.should == 3
    end

    it "should contain key/value pairs 1, 3 and 4" do
      @hash_3.flatten.should == { :key1 => 1, :key4 => 4, :key3 => nil}
    end
  end

end
