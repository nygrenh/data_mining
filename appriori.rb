require_relative 'all'

def appriori(students, support, courses)
  k = 1
  until courses.empty?
    time = Benchmark.measure do
      res = ThreadSafe::Array.new
      Parellel.each(appriori_gen(courses)) do |course|
        s = support(students, course)
        res << course if s >= support
      end
      courses = res
    end
    puts "#{courses.size} combinations, size: #{k}, benchmark: #{time.inspect}"
    k += 1
  end
end

def support(codesets, courses)
  res = ThreadSafe::Array.new
  Parallel.each(codesets) do |codes|
    res << 1 if courses.all? { |course| codes.include? course }
  end
  res.size.to_f / codesets.size
end

def appriori_gen(lists)
  return [] if lists.length <= 1
  response = []
  lists[0..-2].each_with_index do |first, index|
    lists[(index + 1)..-1].each do |second|
      response << Magic.union(first, second) if makes_sense(first, second)
    end
  end
  response
end

def makes_sense(first, second)
  return false if first.size == 0 || first.size != second.size
  first[0..-2] == second[0..-2]
end

students = Students.new('data-2016.csv')
codes = students.map do |student|
  student.attempts.map { |a| a.code.to_i }
end

a = students.courses.map { |e| [e.code.to_i] }
appriori(codes, 0.1, a)
