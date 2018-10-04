class Book
  include ReedsyInterviewModels::Entity
  attributes :title
end

class BookRepository
  include ReedsyInterviewModels::Repository
end

adapter = ReedsyInterviewModels::Adapters::Memory::Adapter.new
mapper = ReedsyInterviewModels::Mapper.new(adapter) do
  collection :books do
    entity Book
    repository BookRepository

    attribute :title
  end
end

repository = mapper[:books]
book = Book.new({ title: '21 Lessons for the 21st Century' })
repository.create(book)

repository.all

# Author / Articles examples

class Author
  include ReedsyInterviewModels::Entity
  attributes :name
end

class AuthorRepository
  include ReedsyInterviewModels::Repository
end

class Article
  include ReedsyInterviewModels::Entity
  attributes :title
end

class ArticleRepository
  include ReedsyInterviewModels::Repository
end

adapter = ReedsyInterviewModels::Adapters::Memory::Adapter.new
ReedsyInterviewModels::Mapper.new(adapter) do
  collection :authors do
    entity Author
    repository AuthorRepository

    attribute :name
  end
  collection :articles do
    entity Article
    repository ArticleRepository

    attribute :title
  end
end

author_repository = ReedsyInterviewModels::Model[:authors]
author = Author.new({ name: 'Yuval Noha Harari' })
author_repository.create(author)
author_repository.all

article_repository = ReedsyInterviewModels::Model[:articles]
article = Article.new({ title: 'The idea of free information is extremely dangerous' })
article_repository.create(article)
article_repository.all
