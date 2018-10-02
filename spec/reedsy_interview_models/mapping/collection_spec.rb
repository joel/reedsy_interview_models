module ReedsyInterviewModels
  module Mapping
    RSpec.describe Collection do
      class Book
        include Entity
        attributes :title
      end

      let(:collection) do
        Collection.new do
          entity Book
          attribute :title
        end
      end

      context 'from a record' do
        let(:record) { collection.deserialize([{ id: 42, title: 'Sapiens' }]).first }

        it '#deserialize' do
          expect(record).to be_instance_of(Book)
          expect(record.title).to eql('Sapiens')
          expect(record.id).to eql(42)
        end
      end

      context 'from an entity' do
        let(:entity) { Book.new({ id: 42, title: 'Sapiens' }) }

        it '#serialize' do
          expect(collection.serialize(entity)).to eql({ id: 42, title: 'Sapiens' })
        end
      end

    end
  end
end
