module Bowling
  class Frame
    def initialize
      @rolls = []
      @bonus_rolls = []
    end

    def score
      return 0 if open?
      @rolls.sum + @bonus_rolls.sum
    end

    def open?
      allow_roll? || allow_bonus_roll?
    end

    def rolls
      @rolls.map(&:itself)
    end

    def bonus_rolls
      @bonus_rolls.map(&:itself)
    end

    def roll(pins)
      if allow_roll?
        @rolls << pins
      elsif allow_bonus_roll?
        @bonus_rolls << pins
      else
        raise "Frame not open"
      end
      self
    end

    def inspect
      "#<#{self.class.name}:#{self.object_id}, rolls: #{rolls}, bonus_rolls: #{bonus_rolls}, score: #{score}>"
    end

    private

    def allow_roll?
      @rolls.count == 0 ||
      (@rolls.count == 1 && @rolls.sum < 10)
    end

    def allow_bonus_roll?
      (@rolls.count == 2 && @rolls.sum == 10 && @bonus_rolls.count < 1) ||
      (@rolls.count == 1 && @rolls.sum == 10 && @bonus_rolls.count < 2)
    end
  end
end
