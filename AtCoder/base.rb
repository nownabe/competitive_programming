class Base
  class << self
    def run
      if ENV["ATCODER_TEST"] == "true"
        test
      else
        solve
      end
    end

    def test
      @samples.each_with_index do |_, i|
        @sample_number = i
        @sample_offset = 0
        @sample_actual = []

        instance = new
        instance.run

        puts
        if check
          puts "Sample #{i} - OK"
          puts
        else
          puts "Sample #{i} - Failed"
          puts
          puts "    Input:"
          puts "      #{sample_input}"
          puts
          puts "    Expected:"
          puts "      #{sample_expect}"
          puts
          puts "    Actual:"
          puts "      #{sample_actual}"
          puts
        end
      end
    end

    def solve
      new.run
    end

    def add_sample(input:, expect:)
      @samples ||= []
      @samples << {
        input: input,
        expect: expect,
      }
    end

    def sample_gets
      res = sample_input[@sample_offset] + "\n"
      @sample_offset += 1
      res
    end

    def sample_puts(s)
      @sample_actual << s
    end

    private

    def check
      sample_expect == @sample_actual
    end

    def sample_input
      @samples[@sample_number][:input]
    end

    def sample_expect
      @samples[@sample_number][:expect]
    end

    def sample_actual
      @sample_actual
    end
  end

  if ENV["ATCODER_TEST"] == "true"
    def gets
      self.class.sample_gets
    end

    def puts(s)
      self.class.sample_puts(s)
    end
  end
end
