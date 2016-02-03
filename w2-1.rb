def support(orders, symbols)
  supportive = orders.dup
  symbols.each_char do |symbol|
    supportive.select! { |o| o.include? symbol }
  end
  supportive.count.to_f / orders.count
end

orders = []
File.readlines('book_orders').each do |line|
  orders << line.split(' ')
end
require 'byebug'; puts 'a'
