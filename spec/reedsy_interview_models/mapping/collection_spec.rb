module ReedsyInterviewModels
  module Mapping
    RSpec.describe Collection do
      include_context 'book'

      context 'from a record' do
        let(:record) { collection.deserialize([{ id: 42, title: 'Sapiens' }]).first }

        it '#deserialize' do
          expect(record).to be_instance_of(Book)
          expect(record.title).to eql('Sapiens')
          expect(record.id).to eql(42)
        end
      end

      context 'from an entity' do
        let(:entity) { Book.new({ title: 'Sapiens' }) }

        it '#serialize' do
          expect(collection.serialize(entity)).to eql({ title: 'Sapiens' })
        end
      end

    end
  end
end
