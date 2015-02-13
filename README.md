# RSpec Mail Matchers

These are some RSpec matchers to be used with the [Mail gem](https://github.com/mikel/mail).

The mail gem already includes some rspec matchers but these are for if you want to use the expect syntax in your specs.

You can make assertions against a specific Mail::Message, but there is no functionality for finding the message for you like the included matchers.

[The full list of matchers are defined in this file.](lib/rspec-mail-matchers.rb)

## Installation

Add this line to your application's Gemfile in the test group:

    gem 'rspec-mail-matchers'

And then execute:

    $ bundle

## Usage

```ruby

describe 'sending an email' do

Mail.defaults do
  delivery_method :test # in practice you'd do this in spec_helper.rb
end

describe "sending an email" do
  before(:each) do
    Mail::TestMailer.deliveries.clear

    Mail.deliver do
      to ['ed@reevoo.com', 'foo@bar.com']
      from 'test@example.com'
      subject 'testing'

      text_part do
        body 'This is plain text'
      end
    
      html_part do
        content_type 'text/html; charset=UTF-8'
        body '<h1>This is HTML</h1>'
      end
    end
  end
  
  let(:email) { Mail::TestMailer.deliveries.last }

  specify { expect(email).to be_to('ed@reevoo.com') } }

  specify { expect(email).to be_to('foo@bar.com') }

  specify { expect(email).to be_to('foo@bar.com', 'ed@reevoo.com') }

  it 'has a text and a html part' do
    expect(email).to have_html_body('<h1>This is HTML</h1>')
    expect(email).to have_text_body('This is plain text')
  end

end
```

# Contributing

1. Fork it ( http://github.com/reevoo/rspec-mail-matchers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
