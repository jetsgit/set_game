require 'spec_helper'

describe SetGame::Finder do

  let(:card_set_good) do
    arr = []
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[0], shape: SetGame::Constants::SHAPE[0], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[0])
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[0], shape: SetGame::Constants::SHAPE[1], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[1])
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[0], shape: SetGame::Constants::SHAPE[2], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[2])
  end

  let(:card_set_bad) do
    arr = []
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[1], shape: SetGame::Constants::SHAPE[0], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[0])
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[0], shape: SetGame::Constants::SHAPE[0], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[1])
    arr << SetGame::Card.new( color: SetGame::Constants::COLOR[1], shape: SetGame::Constants::SHAPE[2], pattern: SetGame::Constants::PATTERN[1], number: SetGame::Constants::NUMBER[2])
  end

  let(:finder) {SetGame::Finder.new}

  describe "SetGame::Finder#unique_set" do

    it "should return true if a set of attributes is true" do
      finder.unique_set(:color, SetGame::Constants::COLOR_MASK, card_set_good).must_be :==, true
    end

    it "should return false if a set of attributes is false" do
      finder.unique_set(:color, SetGame::Constants::COLOR_MASK, card_set_bad).must_be :==, false
    end
  end

  let(:equal_flags) { arr = []; arr[SetGame::Constants::NUMBER[0][:one], SetGame::Constants::NUMBER[1][:one], SetGame::Constants::NUMBER[2][:one]] }
  let(:unique_flags) do
    arr= []
    arr[0] = SetGame::Constants::NUMBER[0][:one]
    arr[1] = SetGame::Constants::NUMBER[1][:two]
    arr[2] = SetGame::Constants::NUMBER[2][:three]
    arr
  end
  let(:equal_flags) do
    arr= []
    arr[0] = SetGame::Constants::NUMBER[0][:one]
    arr[1] = SetGame::Constants::NUMBER[0][:one]
    arr[2] = SetGame::Constants::NUMBER[0][:one]
    arr
  end
  let(:mismatch_flags) do
    arr= []
    arr[0] = SetGame::Constants::NUMBER[0][:one]
    arr[1] = SetGame::Constants::NUMBER[0][:one]
    arr[2] = SetGame::Constants::NUMBER[2][:three]
    arr
  end
  describe "SetGame::Finder#attr_equal?" do
    it "should be true if all 3 attributes are equal" do
      finder.attr_equal?(equal_flags).must_be :==, true
    end
  end
  describe "SetGame::Finder#attr_equal?" do
    it "should not be true if all 3 attributes are equal" do
      finder.attr_equal?(unique_flags).wont_be :==, true
    end
  end
  describe "SetGame::Finder#attr_uniq?" do
    it "should be true if all 3 attributes are unique" do
      finder.attr_uniq?(unique_flags, SetGame::Constants::NUMBER_MASK).must_be :==, true
    end
  end
  describe "SetGame::Finder#attr_uniq?" do
    it "should be false if all 3 attributes are the same" do
      finder.attr_uniq?(equal_flags, SetGame::Constants::NUMBER_MASK).wont_be :==, true
    end
  end
  describe "SetGame::Finder#attr_uniq?" do
    it "should be false if all 3 attributes are mismatched" do
      finder.attr_uniq?(mismatch_flags, SetGame::Constants::NUMBER_MASK).wont_be :==, true
    end
  end

end
