module Bowling
  RSpec.describe Game do

    describe "#frames" do
      it "has 10 frames" do
        expect(subject.frames.count).to eq 10
      end
    end

    context "with no rolls" do
      describe "#score" do
        it "begins with a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#complete?" do
        it "begins in an incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "begins with an empty list of rolls" do
          expect(subject.rolls).to eq []
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with a single roll of 1" do
      before do
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the roll" do
          expect(subject.rolls).to eq [1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with two rolls of 1 and 1" do
      before do
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 2" do
          expect(subject.score).to eq 2
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with three rolls of 1 and 1 and 1" do
      before do
        subject.roll(1)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 2" do
          expect(subject.score).to eq 2
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with twenty rolls of 1" do
      before do
        20.times { subject.roll(1) }
      end

      describe "#score" do
        it "has a score of 20" do
          expect(subject.score).to eq 20
        end
      end

      describe "#complete?" do
        it "is complete" do
          expect(subject.complete?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Game is complete"
        end
      end
    end

    context "with three rolls of 1, 9, and 1" do
      before do
        subject.roll(1)
        subject.roll(9)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 11" do
          expect(subject.score).to eq 11
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 9, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with four rolls of 1, 9, 1, and 1" do
      before do
        subject.roll(1)
        subject.roll(9)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 13" do
          expect(subject.score).to eq 13
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 9, 1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with three rolls of 10, 1, and 1" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 14" do
          expect(subject.score).to eq 14
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with three rolls of 10, 1, and 9" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(9)
      end

      describe "#score" do
        it "has a score of 20" do
          expect(subject.score).to eq 20
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 1, 9]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with four rolls of 10, 1, 9, and 1" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(9)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 31" do
          expect(subject.score).to eq 31
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 1, 9, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with five rolls of 10, 1, 9, 1, and 1" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(9)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 33" do
          expect(subject.score).to eq 33
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 1, 9, 1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with three rolls of 10, 10, and 10" do
      before do
        subject.roll(10)
        subject.roll(10)
        subject.roll(10)
      end

      describe "#score" do
        it "has a score of 30" do
          expect(subject.score).to eq 30
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 10]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with three rolls of 10, 10, and 1" do
      before do
        subject.roll(10)
        subject.roll(10)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 21" do
          expect(subject.score).to eq 21
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with four rolls of 10, 10, 1, and 1" do
      before do
        subject.roll(10)
        subject.roll(10)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 35" do
          expect(subject.score).to eq 35
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 1, 1]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with four rolls of 10, 10, 1, and 9" do
      before do
        subject.roll(10)
        subject.roll(10)
        subject.roll(1)
        subject.roll(9)
      end

      describe "#score" do
        it "has a score of 41" do
          expect(subject.score).to eq 41
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 1, 9]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with a perfect game" do
      before do
        12.times { subject.roll(10) }
      end

      describe "#score" do
        it "has a score of 300" do
          expect(subject.score).to eq 300
        end
      end

      describe "#complete?" do
        it "is complete" do
          expect(subject.complete?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Game is complete"
        end
      end
    end

    context "with just shy of a perfect game" do
      before do
        11.times { subject.roll(10) }
      end

      describe "#score" do
        it "has a score of 270" do
          expect(subject.score).to eq 270
        end
      end

      describe "#complete?" do
        it "remains in incomplete state" do
          expect(subject.complete?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
        end
      end

      describe "#roll" do
        it "increase the count of rolls by 1" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with an almost perfect game ending with 9, 1" do
      before do
        10.times { subject.roll(10) }
        subject.roll(9)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 289" do
          expect(subject.score).to eq 289
        end
      end

      describe "#complete?" do
        it "is complete" do
          expect(subject.complete?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 1]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Game is complete"
        end
      end
    end

    context "with an almost perfect game ending with 9, 0" do
      before do
        10.times { subject.roll(10) }
        subject.roll(9)
        subject.roll(0)
      end

      describe "#score" do
        it "has a score of 288" do
          expect(subject.score).to eq 288
        end
      end

      describe "#complete?" do
        it "is complete" do
          expect(subject.complete?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 0]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Game is complete"
        end
      end
    end
  end
end
