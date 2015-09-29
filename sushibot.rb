require "cinch"
require_relative "./response"

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "SushiBot"
    c.server = "sushichat.no-ip.org"
    c.channels = ["#losalamos"]
    c.plugins.plugins = [Response]
  end
end

bot.start
