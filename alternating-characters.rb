class Alternator
  attr_accessor :n

  def read_strings
    @n = gets.to_i
    for i in 0..@n-1
      strings = gets.chomp.to_s
      squeezed = strings.squeeze
      puts strings.length - squeezed.length
    end
  end

end