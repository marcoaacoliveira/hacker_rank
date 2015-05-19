n = gets.to_i
arr_strings = Array.new(n)
for i in 0..n-1
  arr_strings[i] = gets.chomp.to_s
end
cont = 0
for i in 0..arr_strings.count-1 #todas posicoes do vetor
  match = arr_strings[i]
  j=0
  while j < match.length #cada caracter da string
      verified = true
      h=0
      while verified && h < arr_strings.count #verifica todas strings até achar uma string que nao tenha o caracter
        verified = false unless arr_strings[h].include? match[j]
       h=h+1
      end
      if verified
        removing = match[j]
        cont = cont+1
        arr_strings.each do |pos|
          pos.delete! removing
        end
      else
        j=j+1
      end
  end
end
puts cont
