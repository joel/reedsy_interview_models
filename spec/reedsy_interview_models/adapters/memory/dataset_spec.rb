module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Dataset do
        let(:record)  {{ name: 'A Record' }}
        let(:dataset) { Dataset.new('test') }

        it 'insert a record' do
          expect {
            dataset.insert(record)
          }.to change {
            dataset.size
          }.from(0).to(1).and change {
            record[:id]
          }.from(nil).to(1)

          expect(dataset.all).to eql([ id: 1, name: 'A Record' ])
        end
      end
    end
  end
end
