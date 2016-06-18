require './World'
require './Rooms'
require './Combat'
require './Player'
require './Monster'
require './Item'
require './Story'
require './Randomize'
require './Parser'
require './Inventory'

class String
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m"
    end
    def green
      colorize(32)
    end

    def yellow
      colorize(33)
    end

    def blue
      colorize(34)
    end

    def pink
      colorize(35)
    end

    def light_blue
      colorize(36)
    end
    def red
      colorize(31)
    end
end
