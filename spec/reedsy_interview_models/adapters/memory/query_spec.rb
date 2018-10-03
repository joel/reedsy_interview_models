module ReedsyInterviewModels
  module Adapters
    module Memory
      RSpec.describe Query do
        include_context 'book'

        let(:records) do
          {
            1 => { title: 'Sapiens',  id: 1 },
            2 => { title: 'Homo Deus',  id: 2 },
            3 => { title: '21 Lessons for the 21st Century', id: 3 }
          }
        end

        let(:dataset) { Dataset.new(collection) }

        before { expect(dataset).to receive(:records) { records } }

        describe '#where' do
          it 'return the filtered result' do
            expect(
              Query.new(dataset) do
                where('title.eq' => 'Sapiens').
                where('id.eq' => 1)
              end.all
            ).to eq([{ id: 1, title: 'Sapiens' }])
          end
        end

        describe '#+' do
          it 'return the filtered result' do
            expect(
              (
                Query.new(dataset) { where('title.eq' => 'Sapiens') } +
                Query.new(dataset) { where('id.eq' => 1) }
              ).all
            ).to eq([{ id: 1, title: 'Sapiens' }])
          end
        end

      end
    end
  end
end
