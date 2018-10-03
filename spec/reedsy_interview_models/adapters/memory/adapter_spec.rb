module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Adapter do
        include_context 'book'

        subject { described_class.new }

        let(:dataset) { Dataset.new }

        context 'with records' do
          let(:records) do
            {
              1 => { title: 'Sapiens',  id: 1 },
              2 => { title: 'Homo Deus',  id: 2 },
              3 => { title: '21 Lessons for the 21st Century', id: 3 }
            }
          end

          before do
            expect(dataset).to receive(:records).and_return(records)
            expect(subject).to receive(:dataset) { dataset }
          end

          it '#all' do
            expect(subject.all(collection).sample).to be_instance_of(Book)
          end

          it '#find' do
            expect(subject.find(collection: collection, id: 1)).to be_instance_of(Book)
          end
        end

        context 'without records' do
          let(:entity) { Book.new({ title: 'A Title' }) }

          it '#create' do
            expect {
              subject.create(collection: collection, entity: entity)
            }.to change {
              subject.all(collection)
            }.from([]).to([be_instance_of(Book)])
          end
        end

      end
    end
  end
end
