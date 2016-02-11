require_relative 'all'

class SequenceAppriori
  def appriori(students, support, courses)
    k = 0
    until courses.empty?
      parallel = Parallel
      time = Benchmark.measure do
        res = ThreadSafe::Array.new
        parallel.each(generate(courses)) do |course|
          s = support(students, course)
          if s >= support
            res << course
            puts "#{s}, #{course.inspect}"
          end
        end
        courses = res
      end
      puts "#{courses.size} combinations, size: #{k}, benchmark: #{time.inspect}"
      puts courses.inspect
      k += 1
    end
  end

  def support(students, courses)
    res = 0
    semaphore = Mutex.new
    Parallel.each(students) do |student|
      indexes = courses.map { |course| student.index { |s| course.all? { |c| s.include? c } } }
      next unless indexes.each_cons(2).all? { |p, n| (p <=> n) != 1 } && indexes.none?(&:nil?) # sorted?
      semaphore.synchronize do
        res += 1
      end
    end
    res.to_f / students.size
  end

  def generate(lists)
    return [] if lists.length <= 1
    Enumerator.new do |enum|
      lists[0..-2].each_with_index do |first, index|
        lists[(index + 1)..-1].each do |second|
          candidate = union(first, second)
          enum.yield candidate if should_be_combined?(first, second) && passes_prune?(lists, candidate)
        end
      end
    end
  end

  def passes_prune?(previous, candidate)
    previous = previous.deep_dup.each(&:flatten!)
    subsequences(candidate).all? { |s| previous.include? s }
  end

  def subsequences(candidate)
    subs = []
    candidate = candidate.flatten
    removable = candidate[1..-2]
    removable.each_with_index do |_r, index|
      subs << ([candidate[0]] + removable[0...index] + removable[(index + 1)..-1] + [candidate[-1]])
    end
    subs
  end

  def union(first, second)
    first = first.deep_dup
    to_add = second[-1]
    if to_add.length > 1
      first[-1] << to_add[-1]
    else
      first << second[-1]
    end
    first
  end

  def should_be_combined?(first, second)
    first = first.flatten
    second = second.flatten
    first_compare = first[1..-1]
    second_compare = second[0..-2]
    first_compare == second_compare
  end
end
