require "cinch"

class Sushi
  include Cinch::Plugin
  def initialize(*args)
    super

    @path = "plugins/sushi/ascii/"

    if @files.nil?
      @files = []
      Dir.entries(@path).each do |f|
        @files.push(f) unless File.directory? f
      end
    end
  end

  match "sushi", :method => :sushi

  def sushi(m)
    index = rand(@files.length - 1)
    selected = @files[index]
    
    File.readlines(@path + selected).each do |t|
      m.reply t
    end
  end
end
