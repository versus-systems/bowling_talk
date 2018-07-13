module Bowling
  RSpec.describe Frame do

    context "with no rolls" do
      describe "#score" do
        it "begins with a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#open?" do
        it "begins in an open state" do
          expect(subject.open?).to be true
        end
      end

      describe "#rolls" do
        it "begins with an empty list of rolls" do
          expect(subject.rolls).to eq []
        end
      end

      describe "#bonus_rolls" do
        it "begins with an empty list of bonus rolls" do
          expect(subject.bonus_rolls).to eq []
        end
      end

      describe "#roll" do
        it "increase the count of rolls by one" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with 1 roll of 1" do
      before do
        subject.roll(1)
      end

      describe "#score" do
        it "keeps a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#open?" do
        it "remains open" do
          expect(subject.open?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1]
        end
      end

      describe "#bonus_rolls" do
        it "is empty" do
          expect(subject.bonus_rolls).to eq []
        end
      end

      describe "#roll" do
        it "increase the count of rolls by one" do
          expect {subject.roll(1)}.to change {subject.rolls.count}.by(1)
        end
      end
    end

    context "with a roll of 1 and another roll of 1" do
      before do
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "has a score of 2" do
          expect(subject.score).to eq 2
        end
      end

      describe "#open?" do
        it "closes" do
          expect(subject.open?).to be false
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 1]
        end
      end

      describe "#bonus_rolls" do
        it "is empty" do
          expect(subject.bonus_rolls).to eq []
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Frame not open"
        end
      end
    end

    context "with a roll of 1 and a roll of 9" do
      before do
        subject.roll(1)
        subject.roll(9)
      end

      describe "#score" do
        it "keeps a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#open?" do
        it "remains open" do
          expect(subject.open?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [1, 9]
        end
      end

      describe "#bonus_rolls" do
        it "is empty" do
          expect(subject.bonus_rolls).to eq []
        end
      end

      describe "#roll" do
        it "does not increase the count of rolls" do
          expect {subject.roll(1)}.not_to change {subject.rolls.count}
        end

        it "increase the count of bonus rolls by one" do
          expect {subject.roll(1)}.to change {subject.bonus_rolls.count}.by(1)
        end
      end
    end

    context "with one roll of 10" do
      before do
        subject.roll(10)
      end

      describe "#score" do
        it "keeps a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#open?" do
        it "remains open" do
          expect(subject.open?).to be true
        end
      end

      describe "#rolls" do
        it "includes the rolls" do
          expect(subject.rolls).to eq [10]
        end
      end

      describe "#bonus_rolls" do
        it "is empty" do
          expect(subject.bonus_rolls).to eq []
        end
      end

      describe "#roll" do
        it "does not increase the count of rolls" do
          expect {subject.roll(1)}.not_to change {subject.rolls.count}
        end

        it "increase the count of bonus rolls by one" do
          expect {subject.roll(1)}.to change {subject.bonus_rolls.count}.by(1)
        end
      end
    end

    context "with 2 rolls totalling 10 and a bonus roll of 1" do
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

      describe "#open?" do
        it "closes" do
          expect(subject.open?).to be false
        end
      end

      describe "#rolls" do
        it "includes the first 2 rolls" do
          expect(subject.rolls).to eq [1, 9]
        end
      end

      describe "#bonus_rolls" do
        it "includes the third roll" do
          expect(subject.bonus_rolls).to eq [1]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Frame not open"
        end
      end
    end

    context "with 1 roll of 10 and a bonus roll of 1" do
      before do
        subject.roll(10)
        subject.roll(1)
      end

      describe "#score" do
        it "keeps a score of 0" do
          expect(subject.score).to eq 0
        end
      end

      describe "#open?" do
        it "remains open" do
          expect(subject.open?).to be true
        end
      end

      describe "#rolls" do
        it "includes the first roll" do
          expect(subject.rolls).to eq [10]
        end
      end

      describe "#bonus_rolls" do
        it "includes the second roll" do
          expect(subject.bonus_rolls).to eq [1]
        end
      end

      describe "#roll" do
        it "does not increase the count of rolls" do
          expect {subject.roll(1)}.not_to change {subject.rolls.count}
        end

        it "increase the count of bonus rolls by one" do
          expect {subject.roll(1)}.to change {subject.bonus_rolls.count}.by(1)
        end
      end
    end

    context "with 1 roll of 10 and 2 bonus rolls of 1 and 1" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(1)
      end

      describe "#score" do
        it "have a score of 12" do
          expect(subject.score).to eq 12
        end
      end

      describe "#open?" do
        it "closes" do
          expect(subject.open?).to be false
        end
      end

      describe "#rolls" do
        it "includes the first roll" do
          expect(subject.rolls).to eq [10]
        end
      end

      describe "#bonus_rolls" do
        it "includes the second and third rolls" do
          expect(subject.bonus_rolls).to eq [1, 1]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Frame not open"
        end
      end
    end

    context "with 1 roll of 10 and 2 bonus rolls of 1 and 9" do
      before do
        subject.roll(10)
        subject.roll(1)
        subject.roll(9)
      end

      describe "#score" do
        it "have a score of 20" do
          expect(subject.score).to eq 20
        end
      end

      describe "#open?" do
        it "closes" do
          expect(subject.open?).to be false
        end
      end

      describe "#rolls" do
        it "includes the first roll" do
          expect(subject.rolls).to eq [10]
        end
      end

      describe "#bonus_rolls" do
        it "includes the second and third rolls" do
          expect(subject.bonus_rolls).to eq [1, 9]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Frame not open"
        end
      end
    end

    context "with 1 roll of 10 and 2 bonus rolls of 10 and 10" do
      before do
        subject.roll(10)
        subject.roll(10)
        subject.roll(10)
      end

      describe "#score" do
        it "have a score of 30" do
          expect(subject.score).to eq 30
        end
      end

      describe "#open?" do
        it "closes" do
          expect(subject.open?).to be false
        end
      end

      describe "#rolls" do
        it "includes the first roll" do
          expect(subject.rolls).to eq [10]
        end
      end

      describe "#bonus_rolls" do
        it "includes the second and third rolls" do
          expect(subject.bonus_rolls).to eq [10, 10]
        end
      end

      describe "#roll" do
        it "raises an error" do
          expect {subject.roll(1)}.to raise_error "Frame not open"
        end
      end
    end
  end
end
