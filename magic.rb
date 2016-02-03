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
    return [] if lists.length <= 1
    response = []

    lists[0..-2].each_with_index do |first, index|
      lists[(index + 1)..-1].each do |second|
        response << union(first, second) if first[0..-2] == second[0..-2]
      end
    end
    response
  end
end
