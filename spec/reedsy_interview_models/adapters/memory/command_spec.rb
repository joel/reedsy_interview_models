module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Command do
        include_context 'book'

        let(:dataset) { Dataset.new('test') }
        let(:command) { described_class.new(dataset: dataset, collection: collection) }
        let(:record)  {{ title: 'A Title' }}
        let(:entity)  { Book.new(record) }

        it 'create a record' do
          expect {
            command.create(entity)
          }.to change {
            dataset.size
          }.to(+1)
        end

      end
    end
  end
end
