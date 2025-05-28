# Ruby module to Encode/Decode strings to Base64

module Base62
  CHARSET = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]

  def self.encode(num)
    return CHARSET[0] if num == 0
    
    result = ''
    while num > 0
      result = CHARSET[num % 62] + result
      num /= 62
    end
    result
  end

  def self.decode(text)
    text.reverse.chars.each_with_index.reduce(0) do |sum, (c, i)|
      sum + CHARSET.index(c) * (62 ** i)
    end     
  end
end
