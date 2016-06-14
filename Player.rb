require './Combat'

class Player
  include Combatable
  attr_accessor

  def initialize
    initialize_stats({maxHP: 20, WepDmg: [1,6]})
    Inventory.new

    puts 'Player Initialized'
  end

  def print_player_status
    puts "*" * 80
    puts "HP: #{@HP}/10"
    puts "Your 'weapon' deals #{@WepDmg} damage."
    puts "*" * 80
  end

  def died
    @room_is = $dungeon_room_list[$dungeon.get_room_of($player)-1].get_room_is
    puts "Shit fam, you died fighting a #{@room_is[:content].name}"
    exit
  end
  def bonus_to_hit
    2
  end
  def ac
    10
  end
end
