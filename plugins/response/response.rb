require "cinch"

class Response
  include Cinch::Plugin

  match /^hello$/i, :use_prefix => false, :method => :hello

  def hello(m)
    m.reply "Hello, #{m.user.nick}!"
  end
end

