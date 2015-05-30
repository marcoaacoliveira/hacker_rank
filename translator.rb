#The OO way

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

gets rna
code = Translator.new rna
code.identify
puts code.dna


# The Ruby Way
codons = { 'UUC'=>'F', 'UUU'=>'F', 'UUA'=>'L', 'UUG'=>'L', 'CUU'=>'L', 'CUC'=>'L','CUA'=>'L','CUG'=>'L', 'AUU'=>'I', 'AUC'=>'I', 'AUA'=>'I', 'AUG'=>'M', 'GUU'=>'V',
           'UCU'=>'S', 'UCC'=>'S', 'UCA'=>'S', 'UCG'=>'S', 'AGU'=>'S', 'AGC'=>'S', 'CCU'=>'P', 'CCC'=>'P', 'CCA'=>'P', 'CCG'=>'P', 'ACU'=>'T', 'ACC'=>'T', 'ACA'=>'T', 'ACG'=>'T',
           'GCU'=>'A', 'GCC'=>'A', 'GCA'=>'A', 'GCG'=>'A', 'UAU'=>'Y', 'UAC'=>'Y', 'CAU'=>'H', 'CAC'=>'H', 'CAA'=>'Q', 'CAG'=>'Q', 'AAU'=>'N', 'AAC'=>'N', 'AAA'=>'K', 'AAG'=>'K',
           'GAU'=>'D', 'GAC'=>'D','GAA'=>'E', 'GAG'=>'E', 'UGU'=>'C', 'UGC'=>'C',  'UGG'=>'W', 'CGU'=>'R', 'CGC'=>'R', 'CGA'=>'R', 'CGG'=>'R', 'AGA'=>'R', 'AGG'=>'R',
           'GGU'=>'G',  'GGC'=>'G', 'GGA'=>'G', 'GGG'=>'G', 'UAA'=>'Stop', 'UGA'=>'Stop', 'UAG'=>'Stop'
}

rna.scan(/.../).map{|i| codons[i]}.take_while{|i| codons[i]!='Stop'}.join