require './Combat'

class Monster
  attr_accessor :name
  include Combatable
  def name
    @name
  end
  def died
    $dungeon.get_room_of($player).clear
    $dungeon.get_room_of($player).loot_body(Roll.gold)
    $player.gain_xp(2)#*monster level
  end
end


class FrogLizard < Monster
  def initialize
    initialize_stats({maxHP: 10, WepDmg: [1,3]})
    @name = "Frog Lizard"
  end
end

class LizardFrog < Monster
  def initialize
    initialize_stats({maxHP: 7, WepDmg: [2,2]})
    @name = "Lizard Frog"
  end
end
