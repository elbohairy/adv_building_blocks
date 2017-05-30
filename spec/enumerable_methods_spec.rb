require 'rspec'
require './enumerable_methods'

false_array = [false, false, false]
true_array = [true, true, true]
words_array = %w[ant bear cat]

describe 'Enumerable' do

  describe '::my_select' do
    context "given only false values" do
      it "returns an empty array" do
        expect(false_array.my_select {|x| x}).to eql([])
      end
    end

    context "given only true values" do
      it "returns the same array" do
        expect(true_array.my_select {|x| x}).to eql(true_array)
      end
    end
  end

  describe '::my_all?' do
    context "given a false block" do
      it "returns false" do
        expect(words_array.my_all? {|x| x.length >= 4}).to eql(false)
      end
    end

    context "given a true block" do
      it "returns true" do
        expect(words_array.my_all? {|x| x.length >= 3}).to eql(true)
      end
    end
  end

  describe '::my_any?' do
    context "given a false block" do
      it "returns false" do
        expect(words_array.my_any? {|x| x == 'dog'}).to eql(false)
      end
    end

    context "given a true block" do
      it "returns true" do
        expect(words_array.my_any? {|x| x== 'ant'}).to eql(true)
      end
    end
  end

  describe '::my_none?' do
    context "given a false block" do
      it "returns false" do
        expect(words_array.my_none? {|x| x == 'ant'}).to eql(false)
      end
    end

    context "given a true block" do
      it "returns true" do
        expect(words_array.my_none? {|x| x == 'dog'}).to eql(true)
      end
    end
  end

  describe '::my_count' do
    context "given an empty array" do
      it "returns 0" do
        expect([].my_count).to eql(0)
      end
    end

    context "given an array with 3 items" do
      it "returns 3" do
        expect(true_array.my_count).to eql(3)
      end
    end
  end

  describe '::my_map' do
    context "given a block that multiplies by 2" do
      it "returns an array of numbers multiplied by 2" do
        expect([2, 4, 6].my_map {|x| x * 2 }). to eql([4, 8, 12])
      end
    end

    context "given a block that does nothing" do
      it "returns the same array" do
        expect(words_array.my_map {|x| x}).to eql(words_array)
      end
    end
  end




end