require 'statistics'

describe Statistics do
    describe '.mean' do
        it 'should compute mean' do
            m = Statistics.mean([3,4,5,6])
            expect(m).to eql(4.5)
        end
    end

    describe '.median' do
        it 'should compute median for odd sized array' do
            m = Statistics.median([3,4,5,6,7])
            expect(m).to eql(5)
        end

        it 'should compute median for even sized array' do
            m = Statistics.median([3,4,5,6])
            expect(m).to eql(4.5)
        end
    end

    describe '.stdev' do
        it 'should compute stdev' do
            s = Statistics.stdev([3,4,5,6])
            expect(s).to be_within(0.1).of(1.2)
        end
    end
end
