class Gemstone
  attr_accessor :rocks, :cont, :matching

  def get_rocks
    n = gets.to_i
    @rocks = Array.new(n)
    for i in 0..n-1
      @rocks[i] = gets.chomp.to_s
    end
  end

  def show_rocks
    @rocks.each do |rock|
      puts rock
    end
  end

  def identify_gems
    @cont = 0
    for i in 0..@rocks.count-1 #todas posicoes do vetor
      @matching = @rocks[i]
      rename_it
    end
    puts @cont
  end

  def rename_it
    j = 0
    while j < @matching.length #cada caracter da string
      verified = true
      h=0
      while verified && h < @rocks.count #verifica todas strings até achar uma string que nao tenha o caracter
        verified = false unless @rocks[h].include? @matching[j]
        h=h+1
      end
      if verified
        removing = @matching[j]
        @cont = @cont+1
        @rocks.each do |pos|
          pos.delete! removing
        end
      else
        j=j+1
      end
    end
  end

end