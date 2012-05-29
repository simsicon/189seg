# 189seg

This is a gem using 189works's Chinese segment API service to provide a remote segment way. And it's super easy to use it.


## Installation

Add this line to your application's Gemfile:

    gem '189seg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 189seg

## Usage

'''ruby
phrase = params[:phrase]
client = CnTelecomeSeg::Base.new(YOUR_AP_ID, YOUR_KEY, YOUR_PRODUCT_ID)
segments = client.segment(phrase)
'''

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
