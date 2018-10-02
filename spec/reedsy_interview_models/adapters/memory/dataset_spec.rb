module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Dataset do
        let(:record)  {{ name: 'A record' }}
        let(:dataset) { Dataset.new('test') }

        it do
          expect {
            dataset.insert(record)
          }.to change {
            dataset.size
          }.from(0).to(1).and change {
            record[:id]
          }.from(nil).to(1)
        end
      end
    end
  end
end
