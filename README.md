# ReedsyInterviewModels

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/reedsy_interview_models`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reedsy_interview_models'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reedsy_interview_models

## Usage

```ruby
class Book
  include ReedsyInterviewModels::Entity
  attributes :title
end

class BookRepository
  include ReedsyInterviewModels::Repository
end

adapter = ReedsyInterviewModels::Adapters::Memory::Adapter.new
mapper  = ReedsyInterviewModels::Mapper.new(adapter) do
  collection :books do
    entity Book
    repository BookRepository

    attribute :title
  end
end

repository = mapper[:books]
book = Book.new({ title: '21 Lessons for the 21st Century' })
repository.create(book)
#=> 1

repository.all
#=> [#<Book:0x00007f82a1199b20 @title="21 Lessons for the 21st Century", @id=1>]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/reedsy_interview_models. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ReedsyInterviewModels project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/reedsy_interview_models/blob/master/CODE_OF_CONDUCT.md).
