require_relative '../all.rb'
require_relative '../sequence_appriori.rb'

RSpec.describe 'SequenceAppriori' do
  subject(:appriori) { SequenceAppriori.new }

  # Book page 435
  let(:input) do
    [
      [[1], [2], [3]],
      [[1], [2, 5]],
      [[1], [5], [3]],
      [[2], [3], [4]],
      [[2, 5], [3]],
      [[3], [4], [5]],
      [[5], [3, 4]]
    ]
  end

  let(:generation_output) do
    [
      [[1], [2], [3], [4]],
      [[1], [2, 5], [3]],
      [[1], [5], [3, 4]],
      [[2], [3], [4], [5]],
      [[2, 5], [3, 4]]
    ]
  end

  let(:pruning_output) do
    [
      [[1], [2, 5], [3]]
    ]
  end

  # Takes [[[]]]
  describe 'Generating sequences' do
    it 'should generate n+1 sequences' do
      expect(subject.generate(input)).to eq(generation_output)
    end
  end

  # Union should take a list of lists
  describe '#union' do
    let(:first) { [[1], [2], [3]] }
    let(:second) { [[2], [3], [4]] }

    it 'should combine the groups' do
      expect(subject.union(first, second)).to eq([[1], [2], [3], [4]])
    end

    it 'does not modify first' do
      copy = first.dup
      subject.union(first, second)
      expect(first).to eq(copy)
    end

    context 'When last event is in a pair' do
      let(:first) { [[1, 2], [3]] }
      let(:second) { [[2], [3, 4]] }
      it 'should combine the groups' do
        expect(subject.union(first, second)).to eq([[1, 2], [3, 4]])
      end
    end
  end

  describe '#support' do
    let(:students) do
      [
        [[3], [4, 5]],
        [[3], [4]]
      ]
    end

    it 'should calculate correctly' do
      expect(subject.support(students, [[3], [4]])).to eq(1.0)
    end

    it 'should calculate correctly' do
      expect(subject.support(students, [[3], [4, 5]])).to eq(0.5)
    end

    it 'should calculate correctly' do
      expect(subject.support(students, [[4, 5]])).to eq(0.5)
    end
  end

  describe '#prune' do
    it 'should prune' do
      skip
      expect(subject.prune(input, generation_output)).to eq(pruning_output)
    end
  end

  describe '#subsequences' do
    let(:input) { [[1], [2], [3], [4]] }
    let(:output) do
      [
        [[1], [3], [4]],
        [[1], [2], [4]]
      ]
    end

    it 'should generate subsequences' do
      skip
      expect(subject.subsequences(input)).to eq(output)
    end
  end

  describe '#should_be_combined?' do
    context 'when the groups are compatible' do
      let(:first) { [[1], [2], [3]] }
      let(:second) { [[2], [3], [4]] }

      it 'should return true' do
        expect(subject.should_be_combined?(first, second)).to be_truthy
      end

      context 'when comparison is more difficult at beginning' do
        let(:first) { [[1, 2], [3]] }
        let(:second) { [[2], [3], [4]] }

        it 'should return true' do
          expect(subject.should_be_combined?(first, second)).to be_truthy
        end
      end

      context 'when comparison is more difficult at end' do
        let(:first) { [[1], [2], [3]] }
        let(:second) { [[2], [3, 4]] }

        it 'should return true' do
          expect(subject.should_be_combined?(first, second)).to be_truthy
        end
      end
    end

    context 'when groups are not compatible' do
      let(:first) { [[1], [2], [3]] }
      let(:second) { [[1], [2], [4]] }

      it 'should return false' do
        expect(subject.should_be_combined?(first, second)).to be_falsey
      end
    end
  end
end
