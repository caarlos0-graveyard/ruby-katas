class WordWrapper
  def initialize(limit = 5)
    @limit = limit
  end

  def wrap(words)
    # splits at each space and map
    words.split(" ").map do |word|
      # split every word greater than the limit into chunks of 1 to limit chars
      word.scan(/.{1,#{@limit}}/)
    # join them all
    end.join("\n")
  end
end
