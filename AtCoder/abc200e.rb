# https://atcoder.jp/contests/abc200/tasks/abc200_e

class ABC200E
  attr_reader :n, :k

  def initialize
    @n, @k = gets.split(" ").map(&:to_i)
    @binom = Hash.new { |h, k| h[k] = Hash.new }
  end

  def run
    puts solve3.join(" ")
  end

  # Editorial
  def solve3
    dp1 = Array.new(n + 1) { 0 }

    # 綺麗さ
    n.times { |i| dp1[i + 1] = 1 }

    # 美味しさ
    #
    # 綺麗さに加えて美味しさ(1~N)を選んだ場合の数
    # ナイーブに実装すると次のようにO(N^2)になるのでいもす法を使う
    # dp1.each do |kireisa|
    #   n.times do |oishisa|
    #     oishisa += 1 # 0~(N-1) を 1~N に
    #     dp2[kireisa + oishisa] += 1
    #   end
    # end
    dp2 = Array.new(2 * n + 1) { 0 }
    (n + 1).times do |i|
      dp2[i + 1] += dp1[i]
      dp2[i + 1 + n] -= dp1[i] if i + 1 + n < 2 * n + 1
    end

    (2 * n + 1).times do |i|
      next if i - 1 < 0
      dp2[i] += dp2[i - 1]
    end

    # 人気度
    dp3 = Array.new(3 * n + 1) { 0 }
    (2 * n + 1).times do |i|
      dp3[i + 1] += dp2[i]
      dp3[i + 1 + n] -= dp2[i] if i + 1 + n < 3 * n + 1
    end

    (3 * n + 1).times do |i|
      next if i - 1 < 0
      dp3[i] += dp3[i - 1]
    end

    k = @k

    total = nil
    3.step(3 * n) do |i|
      if k <= dp3[i]
        total = i
        break
      else
        k -= dp3[i]
      end
    end

    # このループで、各oishisaにおいてkireisaが取りうる値の
    # うちk番目に大きいkireisaが求めるkireisaになる
    # kは1から始まる
    # k = 1のときkireisa_min、k = kireisa_max - kireisa_min + 1 のときkireisa_maxとなる
    1.step(n) do |oishisa|
      kireisa_min = [1, total - oishisa - n].max
      kireisa_max = [n, total - oishisa - 1].min

      # kireisa_min > kireisa_max となるとき、
      # oishisaが小さすぎてkireisa+oishisa+ninkido=totalとなる組合せが存在しない
      next if kireisa_min > kireisa_max

      if k > kireisa_max - kireisa_min + 1
        k -= kireisa_max - kireisa_min + 1
        next
      end

      kireisa = kireisa_min + k - 1
      ninkido = total - oishisa - kireisa

      return [oishisa, kireisa, ninkido]
    end
  end

  # WA
  def solve2
    dp1 = Array.new(n + 1) { 0 }

    # 綺麗さ
    n.times { |i| dp1[i + 1] = 1 }

    # 美味しさ
    #
    # 綺麗さに加えて美味しさ(1~N)を選んだ場合の数
    # ナイーブに実装すると次のようにO(N^2)になるのでいもす法を使う
    # dp1.each do |kireisa|
    #   n.times do |oishisa|
    #     oishisa += 1 # 0~(N-1) を 1~N に
    #     dp2[kireisa + oishisa] += 1
    #   end
    # end
    dp2 = Array.new(2 * n + 1) { 0 }
    (n + 1).times do |i|
      dp2[i + 1] += dp1[i]
      dp2[i + 1 + n] -= dp1[i] if i + 1 + n < 2 * n + 1
    end

    (2 * n + 1).times do |i|
      next if i - 1 < 0
      dp2[i] += dp2[i - 1]
    end

    # 人気度
    dp3 = Array.new(3 * n + 1) { 0 }
    (2 * n + 1).times do |i|
      dp3[i + 1] += dp2[i]
      dp3[i + 1 + n] -= dp2[i] if i + 1 + n < 3 * n + 1
    end

    (3 * n + 1).times do |i|
      next if i - 1 < 0
      dp3[i] += dp3[i - 1]
    end

    # 綺麗さ + 美味しさ + 人気度がtotalのグループの中でk番目が答え
    # (全体でK (@k) 番目)

    k = @k
    total = nil

    dp3.each_with_index do |count, sum|
      if k <= count
        total = sum
        break
      end

      k -= count
    end

    # ここまではできた。配列的にはk-1

    kireisa = total <= n * 2 ? 1 : total - n * 2
    oishisa = (total - kireisa) <= n ? 1 : (total - kireisa) - n

    #puts "k=#{k}, total=#{total}, kireisa=#{kireisa}, oishisa=#{oishisa}"

    # ここのループがおかしい
    i = 0
    loop do
      return [kireisa, oishisa, total - kireisa - oishisa] if i == k - 1

      oishisa += 1

      if kireisa + oishisa + 1 > total || oishisa > n
        oishisa = 1
        kireisa += 1
      end

      #p [kireisa, oishisa, total - kireisa - oishisa]

      i += 1
    end
  end

  # WA
  def solve
    cakes = []

    n.times do |i|
      n.times do |j|
        n.times do |k|
          cakes << [i + 1, j + 1, k + 1]
        end
      end
    end

    cakes = cakes.sort do |a, b|
      if a.sum != b.sum
        a.sum - b.sum
      elsif a[0] != b[0]
        a[0] - b[0]
      else
        a[1] - b[1]
      end
    end

    puts "===="
    puts "count: #{cakes.size}"

    groups = cakes.group_by { |c| c.sum }
    puts "groups: #{groups.size}"

    groups.each do |sum, cakes|
      puts "#{sum} (#{cakes.size}) => #{cakes.map { |values| "(#{values.join(",")})" }.join(",")}"
    end

    cakes[k - 1]
  end
end

ABC200E.new.run

__END__
=input
2 5
=expect
1 2 2
=input
1000000 1000000000000000000
=expect
1000000 1000000 1000000
=input
9 47
=expect
3 1 4
