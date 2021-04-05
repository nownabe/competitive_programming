# https://atcoder.jp/contests/abc049/tasks/arc065_b


class Solver
  def initialize(n, roads, rails)
    @n = n
    @roads = roads
    @rails = rails
  end

  def solve
    counts = []

    @n.times do |v|
      connected_by_roads = search_connected(@roads, v)
      connected_by_rails = search_connected(@rails, v)

      counts << (connected_by_roads & connected_by_rails).size
    end

    counts
  end

  def search_connected(graph, start)
    visited = Array.new(@n) { false }
    todo = []

    visited[start] = true
    todo.push(start)

    until todo.empty?
      v = todo.pop
      graph[v].each do |w|
        next if visited[w]

        visited[w] = true
        todo.push(w)
      end
    end

    visited.map.with_index { |v, i| v ? i : nil }.compact
  end
end


class Solver2
  def initialize(n, roads, rails)
    @n = n
    @roads = roads
    @rails = rails
  end

  def solve
    roads_connection = Array.new(@n) { nil }
    rails_connection = Array.new(@n) { nil }

    until roads_connection.all?
      start = roads_connection.index(nil)
      search_connected(@roads, roads_connection, start)
    end

    until rails_connection.all?
      start = rails_connection.index(nil)
      search_connected(@rails, rails_connection, start)
    end

    @n.times.map do |i|
      roads_connected = @n.times.filter { |j| roads_connection[i] == roads_connection[j] }
      rails_connected = @n.times.filter { |j| rails_connection[i] == rails_connection[j] }

      (roads_connected & rails_connected).count
    end
  end

  def search_connected(graph, visited, start)
    todo = []

    visited[start] = start
    todo.push(start)

    until todo.empty?
      v = todo.pop
      graph[v].each do |w|
        next if visited[w]

        visited[w] = start
        todo.push(w)
      end
    end
  end
end


class Solver3
  def initialize(n, roads, rails)
    @n = n
    @roads = roads
    @rails = rails
    @connected = Hash.new { |h, k| h[k] = 0 }
  end

  def solve
    roads_connection = Array.new(@n) { nil }
    rails_connection = Array.new(@n) { nil }

    until roads_connection.all?
      start = roads_connection.index(nil)
      search_connected(@roads, roads_connection, start)
    end

    until rails_connection.all?
      start = rails_connection.index(nil)
      search_connected(@rails, rails_connection, start)
    end

    @n.times { |i| @connected["#{roads_connection[i]}-#{rails_connection[i]}"] += 1 }
    @n.times.map { |i| @connected["#{roads_connection[i]}-#{rails_connection[i]}"] }
  end

  def search_connected(graph, visited, start)
    todo = []

    visited[start] = start
    todo.push(start)

    until todo.empty?
      v = todo.pop
      graph[v].each do |w|
        next if visited[w]

        visited[w] = start
        todo.push(w)
      end
    end
  end
end


class Solver4
  def initialize(n, roads, rails)
    @n = n
    @roads = roads
    @rails = rails
    @connected = Hash.new { |h, k| h[k] = 0 }
  end

  def solve
    roads_connection = Array.new(@n) { nil }
    rails_connection = Array.new(@n) { nil }

    @n.times { |i| search_connected(@roads, roads_connection, i) }
    @n.times { |i| search_connected(@rails, rails_connection, i) }

    @n.times { |i| @connected["#{roads_connection[i]}-#{rails_connection[i]}"] += 1 }
    @n.times.map { |i| @connected["#{roads_connection[i]}-#{rails_connection[i]}"] }
  end

  def search_connected(graph, visited, start)
    return if visited[start]

    todo = []

    visited[start] = start
    todo.push(start)

    until todo.empty?
      v = todo.pop
      graph[v].each do |w|
        next if visited[w]

        visited[w] = start
        todo.push(w)
      end
    end
  end
end


roads = Hash.new { |h, k| h[k] = [] }
rails = Hash.new { |h, k| h[k] = [] }

n, k, l = gets.split(" ").map(&:to_i)

k.times do
  p, q = gets.split(" ").map(&:to_i)
  roads[p - 1] << q - 1
  roads[q - 1] << p - 1
end

l.times do
  r, s = gets.split(" ").map(&:to_i)
  rails[r - 1] << s - 1
  rails[s - 1] << r - 1
end

puts Solver4.new(n, roads, rails).solve.join(" ")
