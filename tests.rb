require 'rubygems'        # => false
require 'bundler/setup'   # => true
ENV['RACK_ENV'] = 'test'  # => "test"

require_relative 'first_app'  # => true
require 'test/unit'           # => true
require 'rack/test'           # => true
require 'faker'               # => true

class FirstAppTest < Test::Unit::TestCase  # => Test::Unit::TestCase
  include Rack::Test::Methods              # => FirstAppTest

  def app
    Sinatra::Application  # => Sinatra::Application, Sinatra::Application, Sinatra::Application
  end                     # => :app

  def test_the_index
    get '/'                                                                                    # => #<Rack::MockResponse:0x007f8da3ef6a90 @original_headers={"Content-Type"=>"text/html;charset=utf-8", "Content-Length"=>"54", "X-XSS-Protection"=>"1; mode=block", "X-Content-Type-Options"=>"nosniff", "X-Frame-Options"=>"SAMEORIGIN"}, @errors="", @body_string=nil, @status=200, @header={"Content-Type"=>"text/html;charset=utf-8", "Content-Length"=>"54", "X-XSS-Protection"=>"1; mode=block", "X-Content-Type-Options"=>"nosniff", "X-Frame-Options"=>"SAMEORIGIN"}, @chunked=false, @writer=#<Proc:0x007f8da3ef67e8@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-1.6.5/lib/rack/response.rb:30 (lambda)>, @block=nil, @length=54, @body=["Welcome to my modest page. Care to take a look around?"]>
    assert last_response.ok?                                                                   # => nil
    assert_equal "Welcome to my modest page. Care to take a look around?", last_response.body  # => nil
  end                                                                                          # => :test_the_index

  def test_names_page
    name = Faker::Name.first_name                                                                       # => "Wilfrid"
    get "/#{name}"                                                                                      # => #<Rack::MockResponse:0x007f8da3f05540 @original_headers={"Content-Type"=>"text/html;charset=utf-8", "Content-Length"=>"63", "X-XSS-Protection"=>"1; mode=block", "X-Content-Type-Options"=>"nosniff", "X-Frame-Options"=>"SAMEORIGIN"}, @errors="", @body_string=nil, @status=200, @header={"Content-Type"=>"text/html;charset=utf-8", "Content-Length"=>"63", "X-XSS-Protection"=>"1; mode=block", "X-Content-Type-Options"=>"nosniff", "X-Frame-Options"=>"SAMEORIGIN"}, @chunked=false, @writer=#<Proc:0x007f8da3f05298@/Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-1.6.5/lib/rack/response.rb:30 (lambda)>, @block=nil, @length=63, @body=["Welcome to my modest page, Wilfrid. Care to take a look around?"]>
    assert last_response.ok?                                                                            # => nil
    assert_equal "Welcome to my modest page, #{name}. Care to take a look around?", last_response.body  # => nil
  end                                                                                                   # => :test_names_page

  def test_lipsums_page
    get '/lorem/tenth_doctor_ipsum'
    assert last_response.ok?
    assert_equal "<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake that for nice. There's something else I've always wanted to say: Allons-y, Alonso! I'm Dr. James McCrimmon from the township of Balamory. People assume that time is a strict progression of cause-and-effect... but actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... timey-wimey... stuff. River, you know my name. You whispered my name in my ear! There's only one reason I would ever tell anyone my name. There's only one time I could...</p>", last_response.body

    get '/lorem/eleventh_doctor_ipsum'
    assert last_response.ok?
    assert_equal "<p>I know. Dinosaurs! On a spaceship! I once spent a hell of a long time trying to get a gobby Australian to Heathrow airport. Brave heart, Clara. I never know why. I only know who. No idea. Just do what I do: hold tight and pretend it's a plan. It's a fez. I wear a fez now. Fezzes are cool. Oh, I always rip out the last page of a book. Then it doesn't have to end. I hate endings! Bow ties are cool. Frightened people. Give me a Dalek any day. Please tell me I didn't get old. Anything but old. I was young! Oh... is he grey?</p>", last_response.body

    get '/lorem/twelfth_doctor_ipsum'
    assert last_response.ok?
    assert_equal "<p>Please just... just see me. I don't know. But I'd probably blame the English. Shush. I was being chased by a giant dinosaur, but I think I've managed to give it the slip. Oh, you've got a dinosaur too! Well, you're very similar heights. Maybe you should wear labels. I'm Scottish. I can complain about things now. I can really complain about things now. He was dead already, I'm saving us. Follow me, and run! I don't think that I'm a hugging person now. Clara, I'm not your boyfriend. I never said it was your mistake.</p>", last_response.body
  end  # => :test_lipsums_page


end  # => :test_lipsums_page

# >> Loaded suite /Users/mstashev/Documents/IronYard/first_app/tests
# >> Started
# >> E
# >> ===============================================================================
# >> Error: test_lipsums_page(FirstAppTest): NameError: uninitialized constant Lipsum
# >> /Users/mstashev/Documents/IronYard/first_app/first_app.rb:27:in `block in <top (required)>'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1611:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1611:in `block in compile!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:975:in `block (3 levels) in route!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:994:in `route_eval'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:975:in `block (2 levels) in route!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1015:in `block in process_route'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1013:in `catch'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1013:in `process_route'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:973:in `block in route!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:972:in `each'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:972:in `route!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1085:in `block in dispatch!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `block in invoke'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `catch'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `invoke'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1082:in `dispatch!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:907:in `block in call!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `block in invoke'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `catch'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1067:in `invoke'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:907:in `call!'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:895:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/xss_header.rb:18:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/path_traversal.rb:16:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/json_csrf.rb:18:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/base.rb:49:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/base.rb:49:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-protection-1.5.3/lib/rack/protection/frame_options.rb:31:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-1.6.5/lib/rack/nulllogger.rb:9:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-1.6.5/lib/rack/head.rb:13:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-1.6.5/lib/rack/methodoverride.rb:22:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:182:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:2013:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1487:in `block in call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1787:in `synchronize'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/sinatra-1.4.8/lib/sinatra/base.rb:1487:in `call'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-test-0.6.3/lib/rack/mock_session.rb:30:in `request'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-test-0.6.3/lib/rack/test.rb:244:in `process_request'
# >> /Users/mstashev/.rvm/gems/ruby-2.4.0/gems/rack-test-0.6.3/lib/rack/test.rb:58:in `get'
# >> /Users/mstashev/Documents/IronYard/first_app/tests.rb:31:in `test_lipsums_page'
# >>      28:   end))
# >>      29:
# >>      30:   $SiB.record_result(:inspect, 43, (def test_lipsums_page
# >>   => 31:     $SiB.record_result(:inspect, 31, (get '/lorem/tenth_doctor_ipsum'))
# >>      32:     $SiB.record_result(:inspect, 32, (assert last_response.ok?))
# >>      33:     $SiB.record_result(:inspect, 33, (assert_equal "<p>Sweet, maybe... Passionate, I suppose... But don't ever mistake that for nice. There's something else I've always wanted to say: Allons-y, Alonso! I'm Dr. James McCrimmon from the township of Balamory. People assume that time is a strict progression of cause-and-effect... but actually, from a non-linear, non-subjective viewpoint, it's more like a big ball of wibbly-wobbly... timey-wimey... stuff. River, you know my name. You whispered my name in my ear! There's only one reason I would ever tell anyone my name. There's only one time I could...</p>", last_response.body))
# >>      34:
# >> ===============================================================================
# >> ..
# >>
# >> Finished in 0.451695 seconds.
# >> ------
# >> 3 tests, 4 assertions, 0 failures, 1 errors, 0 pendings, 0 omissions, 0 notifications
# >> 66.6667% passed
# >> ------
# >> 6.64 tests/s, 8.86 assertions/s
