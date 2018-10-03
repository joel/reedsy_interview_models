class Book
  include ReedsyInterviewModels::Entity
  attributes :title
end

class BookRepository
  include ReedsyInterviewModels::Repository
end

adapter = ReedsyInterviewModels::Adapters::Memory::Adapter.new
ReedsyInterviewModels::Mapper.new(adapter) do
  collection :books do
    entity Book
    repository BookRepository

    attribute :title
  end
end

repository = ReedsyInterviewModels::Model[:books]
book = Book.new({ title: ' Lessons for the 21st Century' })
repository.create(book)

repository.all
