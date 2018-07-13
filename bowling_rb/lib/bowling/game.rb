module Bowling
  class Game
    def initialize
      @frames = (1..10).map { Bowling::Frame.new }
    end

    def score
      @frames.map(&:score).sum
    end

    def complete?
      @frames.none?(&:open?)
    end

    def frames
      @frames.map(&:dup)
    end

    def rolls
      if complete?
        @frames.flat_map(&:rolls) +
        @frames.last.bonus_rolls
      else
        @frames.flat_map(&:rolls) +
        Array(@frames.find(&:open?)&.bonus_rolls)
      end
    end

    def roll(pins)
      raise "Game is complete" if complete?

      updated = @frames.find(&:open?).roll(pins)
      share_bonus(updated)
      self
    end

    def inspect
      "#<#{self.class.name}:#{self.object_id}, rolls: #{rolls}, score: #{score}>"
    end

    private

    def share_bonus(frame)
      return if frame.open?
      return if @frames.last == frame

      frame.bonus_rolls.each do |pins|
        @frames.find(&:open?).roll(pins)
      end
    end
  end
end
