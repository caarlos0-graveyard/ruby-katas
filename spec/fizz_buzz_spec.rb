require "rspec"
require_relative "spec_helper"
require_relative "../lib/fizz_buzz"

describe FizzBuzz do

  subject(:fizzbuzz) { FizzBuzz.new }

  it { should respond_to(:result) }

  context "number divisible by 3" do
    it { fizzbuzz.result(3).should eq("fizz") }
    it { fizzbuzz.result(6).should eq("fizz") }
  end

  context "number divisible by 5" do
    it { fizzbuzz.result(5).should eq("buzz") }
    it { fizzbuzz.result(10).should eq("buzz") }
  end

  context "number divisible by both 3 and 5" do
    it { fizzbuzz.result(15).should eq("fizzbuzz") }
    it { fizzbuzz.result(30).should eq("fizzbuzz") }
  end

  context "number divisible by neither 3 or 5" do
    it { fizzbuzz.result(2).should eq("2") }
    it { fizzbuzz.result(7).should eq("7") }
  end
end
