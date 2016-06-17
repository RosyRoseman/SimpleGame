require './Combat'

class Player
  include Combatable
  attr_accessor :attributes

  def initialize
    Inventory.new
    status_start
    @name                     = "Player"
    @ac                       = 10
    @bab                      = 0
    @maxhp                    = 20
    @hp                       = @maxhp
    @stats                    = {str: 8, dex: 8, con: 8, int: 8, wis: 8, cha: 8}
    @level                    = 1
    @description              = "You."
    attributes_are
    puts 'Player Initialized'
  end

  def attributes_are
    @attributes = {name: @name, ac: @ac, bab: @bab, hp: @hp, maxhp: @maxhp,
                   wepdmg: @wepdmg, stats: @stats, level: @level,
                   status_effects: @status_effects, description: @description}
  end
  def attributes
    @attributes
  end

  def print_player_status
    puts "*" * 80
    puts "HP: #{@hp}/#{@maxhp}"
    puts "Your #{$equipped[:weapon].attributes[:name]} deals #{($equipped[:weapon].attributes[:damage])} damage."
    puts "*" * 80
  end

  def died
    @attributes = $dungeon_room_list[$dungeon.get_room_of($player)-1].attributes
    puts "Shit fam, you died fighting a #{@attributes[:content].name}"
    exit
  end
end
