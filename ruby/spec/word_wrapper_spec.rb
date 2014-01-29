require "rspec"
require_relative "spec_helper"
require_relative "../lib/word_wrapper"

describe WordWrapper do
  subject(:wrapper) { WordWrapper.new(5) }

  it { should respond_to :wrap }

  it { expect(wrapper.wrap(nil)).to eql("") }
  it { expect(wrapper.wrap("")).to eql("") }
  it { expect(wrapper.wrap("regis")).to eql("regis") }
  it { expect(wrapper.wrap("ticaracatica")).to eql("ticar\nacati\nca") }
  it { expect(wrapper.wrap("los tests")).to eql("los\ntests") }
  it {
    expect(wrapper.wrap("carlos alexandro")).to eql("carlo\ns\nalexa\nndro")
  }
  it {
    expect(wrapper.wrap("los test treta")).to eql("los\ntest\ntreta")
  }
  it {
    expect(wrapper.wrap("regis eduardo weizenmann gregol")).to(
      eql("regis\neduar\ndo\nweize\nnmann\ngrego\nl"))
  }
end
