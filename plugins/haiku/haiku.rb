require "cinch"
require "json"

class Haiku
  include Cinch::Plugin

  def initialize(*args)
    super
    @@file ||= File.read("plugins/haiku/haiku.json")
    @@list ||= JSON.parse(@@file)
  end

  match "haiku", :method => :haiku

  def haiku(m)
    index = rand(@@list.length - 1)
    selected = @@list[index]

    output = selected["text"].split("\n")
    output.each do |t|
      m.reply t
    end

    m.reply "—#{selected["author"]}"
  end
end
