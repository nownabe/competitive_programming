# https://atcoder.jp/contests/abc198/tasks/abc198_d

class Problem
  attr_reader :s1, :s2, :s3

  def initialize
    @s1 = gets.chomp
    @s2 = gets.chomp
    @s3 = gets.chomp
  end

  def run
    if ans = solve4
      puts ans
    else
      puts "UNSOLVABLE"
    end
  end

  def solve
    @all_chars = (s1 + s2 + s3).chars.uniq
    @first_chars = [s1[0], s2[0], s3[0]].uniq

    return false if @all_chars.size > 10
    return false if s1.length > s3.length || s2.length > s3.length

    mapping = {}
    @all_chars.each { |c| mapping[c] = nil }

    nums = %w(0 1 2 3 4 5 6 7 8 9)

    search(0, mapping, nums, 0, 0, 0)
  end

  def search(i, mapping, nums, n1, n2, n3)
    if i == @all_chars.size
      n1 = convert(mapping, s1)
      n2 = convert(mapping, s2)
      n3 = convert(mapping, s3)

      if n1 + n2 == n3
        return [n1, n2, n3]
      else
        return false
      end
    end

    c = @all_chars[i]

    available_nums = if @first_chars.include?(c)
        nums.reject { |n| n == "0" }
      else
        nums
      end

    available_nums.each do |n|
      mapping[c] = n
      ans = search(i + 1, mapping, nums.reject { |nn| nn == n })
      mapping[c] = nil

      return ans if ans
    end

    false
  end

  def convert(mapping, s)
    s.chars.map { |c| mapping[c] }.join.to_i
  end

  def solve2
    @all_chars = (s1 + s2 + s3).chars.uniq
    @first_chars = [s1[0], s2[0], s3[0]].uniq

    return false if @all_chars.size > 10
    return false if s1.length > s3.length || s2.length > s3.length

    nums = 10.times.map.to_a

    search2(0, nums, 0, 0, 0)
  end

  def search2(i, nums, n1, n2, n3)
    if i == @all_chars.size
      if n1 + n2 == n3
        return [n1, n2, n3]
      else
        return false
      end
    end

    char = @all_chars[i]
    s1i = s1.chars.map.with_index { |c, i| c == char ? 10 ** (s1.length - i - 1) : nil }.compact
    s2i = s2.chars.map.with_index { |c, i| c == char ? 10 ** (s2.length - i - 1) : nil }.compact
    s3i = s3.chars.map.with_index { |c, i| c == char ? 10 ** (s3.length - i - 1) : nil }.compact

    available_nums = if @first_chars.include?(char)
        nums - [0]
      else
        nums
      end

    available_nums.each do |n|
      next_n1 = s1i.inject(n1) { |sum, i| sum + n * i }
      next_n2 = s2i.inject(n2) { |sum, i| sum + n * i }
      next_n3 = s3i.inject(n3) { |sum, i| sum + n * i }
      ans = search2(i + 1, nums.reject { |nn| nn == n }, next_n1, next_n2, next_n3)

      return ans if ans
    end

    false
  end

  def solve3
    all_chars = (s1 + s2 + s3).chars.uniq
    s1i = s1.chars.map { |c| all_chars.index(c) }
    s2i = s2.chars.map { |c| all_chars.index(c) }
    s3i = s3.chars.map { |c| all_chars.index(c) }
    f1, f2, f3 = [s1[0], s2[0], s3[0]].map { |c| all_chars.index(c) }

    return false if all_chars.size > 10
    return false if s1.length > s3.length || s2.length > s3.length

    all_nums = 10.times.map.to_a

    all_nums.permutation(all_chars.size).each do |nums|
      next if nums[f1] == 0
      next if nums[f2] == 0
      next if nums[f3] == 0

      n1 = s1i.inject(0) { |sum, i| sum * 10 + nums[i] }
      n2 = s2i.inject(0) { |sum, i| sum * 10 + nums[i] }
      n3 = s3i.inject(0) { |sum, i| sum * 10 + nums[i] }

      return [n1, n2, n3] if n1 + n2 == n3
    end

    false
  end

  def solve4
    all_chars = (s1 + s2 + s3).chars.uniq
    s1i = s1.chars.map { |c| all_chars.index(c) }
    s2i = s2.chars.map { |c| all_chars.index(c) }
    s3i = s3.chars.map { |c| all_chars.index(c) }
    f2 = all_chars.index(s2[0])
    f3 = all_chars.index(s3[0])
    l1 = s1.length
    l2 = s2.length
    l3 = s3.length

    return false if all_chars.size > 10
    return false if s1.length > s3.length || s2.length > s3.length

    all_nums = 10.times.map.to_a

    all_nums.permutation(all_chars.size).each do |nums|
      next if nums[0] == 0
      next if nums[f2] == 0
      next if nums[f3] == 0

      n1 = 0
      i = 0
      while i < l1
        n1 = n1 * 10 + nums[s1i[i]]
        i += 1
      end

      n2 = 0
      i = 0
      while i < l2
        n2 = n2 * 10 + nums[s2i[i]]
        i += 1
      end

      n3 = 0
      i = 0
      while i < l3
        n3 = n3 * 10 + nums[s3i[i]]
        i += 1
      end

      return [n1, n2, n3] if n1 + n2 == n3
    end

    false
  end
end

Problem.new.run
