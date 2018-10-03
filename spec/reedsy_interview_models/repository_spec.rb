module ReedsyInterviewModels
  RSpec.describe Repository do
    include_context 'book'

    let(:adapter)    { Adapters::Memory::Adapter.new }
    let(:repository) { BookRepository.new(adapter: adapter, collection: collection) }
    let(:entity)     { Book.new({ title: 'A Title' }) }

    it '#create' do
      expect {
        repository.create(entity)
      }.to change {
        entity.id
      }.from(nil).to(1)

      expect(repository.all.first).to be_instance_of(Book)

      expect(repository.find(1)).to be_instance_of(Book)
    end

  end
end
