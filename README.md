# CollectionController

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/collection_controller`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'collection_controller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install collection_controller

## Usage

Say you have a Rails app that needs to manage Widgets.  You create a WidgetsController and add

`include CollectionController`

to it.

```
class WidgetsController < ApplicationController
  include CollectionController

  def index
    @widgets = collection
  end

  def new
    member = build_member
  end

  def edit
    member  # refers to the widget in the URL
  end

  def show
    member  # refers to the widget in the URL
  end

  def create
    member = build_member(valid_params) # creates a new member from the params
    member.save!
  end

  def update
    member.update!(valid_params)
  end

  def destroy
    member.destroy!
  end

  protected

  def valid_params
    params.permit(:name, :value, :status)
  end
end
```

I find I use this frequently enough to warrant being a gem.  I like that there's very little under the hood, but it saves a lot of boilerplate coding on standard controllers.

Override `collection` if your controller has to do something odd to find the collection of things.

If your members are nested, you can do something like:

```
def collection
  @collection ||= begin
    if params[:parent_id]
      Parent.find(params[:parent_id]).widgets
    else
      super
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/collection_controller.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
