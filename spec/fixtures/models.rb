class Book
  include ReedsyInterviewModels::Entity
  attributes :title
end

class BookRepository
  include ReedsyInterviewModels::Repository
end
