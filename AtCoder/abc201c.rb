#

class ABC201C
  attr_reader :s

  def initialize
    # gets.split(" ").map(&:to_i)
    # @as = []
    # @n.times { @as << gets.to_i }
    @s = gets.chomp
  end

  def run
    puts solve
  end

  def solve
    confirmed_nums = []
    unknown_nums = []

    s.chars.each_with_index do |c, i|
      if c == "o"
        confirmed_nums << i
      elsif c == "?"
        unknown_nums << i
      end
    end

    return 0 if confirmed_nums.size > 4
    return 0 if confirmed_nums.size == 0 && unknown_nums.size == 0
    return 4 * 3 * 2 if confirmed_nums.size == 4

    @nums = []
    @confirmed = confirmed_nums
    @unknown = unknown_nums

    search("")

    @nums.uniq.size
  end

  def search(nums)
    if nums.size == 4
      @nums << nums
      return
    end

    unused = @confirmed.select { |n| !nums.include?(n.to_s) }

    if unused.size == 4 - nums.size
      unused.each { |n| search("#{nums}#{n}") }
    else
      (@confirmed + @unknown).each { |n| search("#{nums}#{n}") }
    end
  end
end

ABC201C.new.run

__END__
=input
=expect
=input
=expect
=input
=expect
=input
=expect
=input
=expect
