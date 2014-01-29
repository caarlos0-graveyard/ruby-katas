require "rspec"
require_relative "spec_helper"
require_relative "../lib/mars_rover"

describe MarsRover do
  subject(:rover) { MarsRover.new(12, 42, 'E') }

  context "api" do
    it { should respond_to(:x) }
    it { should respond_to(:y) }
    it { should respond_to(:direction) }
    it { should respond_to(:command) }
  end

  context "#initialize" do
    it { rover.x.should eq(12) }
    it { rover.y.should eq(42) }
    it { rover.direction.should eq('E') }
  end

  context "orientation" do
    it "should be able to turn left" do
      rover.command('l')
      rover.direction.should eq('N')
    end

    it "should be able to turn right" do
      rover.command('r')
      rover.direction.should eq('S')
    end
  end

  context "movimentation" do
    it "should not crash if nil is given" do
      rover.command(nil)
      rover.x.should eq(12)
      rover.y.should eq(42)
    end

    context "horizontal" do
      it "should be able to move forward" do
        rover.command('f')
        rover.x.should eq(13)
        rover.y.should eq(42)
      end

      it "should be able to move backward" do
        rover.command('b')
        rover.x.should eq(11)
        rover.y.should eq(42)
      end
    end
  end
end
