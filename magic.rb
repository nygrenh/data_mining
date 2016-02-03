class Magic
  def self.support(transactions, itemset)
    supportive_transactions = transactions.count do |transaction|
      itemset.all? { |item| transaction.include? item }
    end
    supportive_transactions.to_f / transactions.count
  end

  def self.union(set1, set2)
    set1 | set2
  end

  def self.generate(lists)
    response = []
    return response if lists.length <= 1

    index = 0
    while index < (lists.length - 1)
      first = lists[index]
      index2 = index + 1
      while index2 < lists.length
        second = lists[index2]
        response << union(first, second) if first[0..-2] == second[0..-2]
        index2 += 1
      end
      index += 1
    end
    response
  end
end
