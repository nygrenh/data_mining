require_relative 'all'

min_support = 0.1
lists = [[[123], [213], [21]]]
orig_l = lists

until lists.empty?
  candidates = Magic.generate(lists)
  candidates.each_with_index do |candidate, i|
    supp = Magic.support(orig_l, candidate)
    if supp < min_support
      candidates.delete_at(i)
    else
      puts "#{candidate.inspect}, #{supp}"
    end
    lists = candidates
  end
end
