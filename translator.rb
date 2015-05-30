class Translator
  attr_accessor :rna
  attr_reader :dna

  def initialize(rna)
    @rna = rna
    @dna = ''
  end

  def identify
    i = -3
    j = 0
    while ((@rna[i...j] != 'UAA' && @rna[i...j] != 'UGA' && @rna[i...j] != 'UAG') && (j<=@rna.length))
      i = i + 3
      j = j + 3
      case @rna[i...j]
        when 'UUC','UUU'
          convert 'F'
        when 'UUA', 'UUG','CUU', 'CUC', 'CUA', 'CUG'
          convert 'L'
        when 'AUU','AUC', 'AUA'
          convert 'I'
        when 'AUG'
          convert 'M'
        when 'GUU', 'GUC', 'GUA', 'GUG'
          convert 'V'
        when 'UCU', 'UCC', 'UCA', 'UCG', 'AGU', 'AGC'
          convert 'S'
        when 'CCU', 'CCC', 'CCA', 'CCG'
          convert 'P'
        when 'ACU','ACC', 'ACA', 'ACG'
          convert 'T'
        when 'GCU', 'GCC', 'GCA', 'GCG'
          convert 'A'
        when 'UAU', 'UAC'
          convert 'Y'
        when 'CAU', 'CAC'
          convert 'H'
        when 'CAA', 'CAG'
          convert 'Q'
        when 'AAU', 'AAC'
          convert 'N'
        when 'AAA', 'AAG'
          convert 'K'
        when 'GAU', 'GAC'
          convert 'D'
        when 'GAA', 'GAG'
          convert 'E'
        when 'UGU', 'UGC'
          convert 'C'
        when 'UGG'
          convert 'W'
        when 'CGU', 'CGC', 'CGA', 'CGG', 'AGA', 'AGG'
          convert 'R'
        when 'GGU', 'GGC', 'GGA', 'GGG'
          convert 'G'
      end
    end
  end

  private
  def convert(char)
    @dna = @dna + char
  end
end

code = Translator.new 'AUG'
code.identify
puts code.dna