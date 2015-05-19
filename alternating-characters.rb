n = gets.to_i
for i in 0..n-1
  strings = gets
  squeezed = strings.squeeze
  puts strings.length - squeezed.length
end