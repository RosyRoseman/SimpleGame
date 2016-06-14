require './Combat'

class Monster
  attr_accessor :name
  include Combatable
  def name
    @name
  end
  def died
    $dungeon_room_list[($dungeon.get_room_of($player))-1].clear(self.name, Roll.gold(self.loot))#<<For the death flavor text.
#    $player.gain_xp(2)#*monster level
  end
  def hits(target)
    damage = Roll.damage(self.WepDmg)
    puts "The monster hits you for #{damage} points of damage."
    target.TakeDmg(damage)
  end
end


class FrogLizard < Monster
  def initialize
    initialize_stats({maxHP: 10, WepDmg: [1,3]})
    @name = "Frog Lizard"
  end
  def loot
    range = [2, 5]
  end
end

class LizardFrog < Monster
  def initialize
    initialize_stats({maxHP: 7, WepDmg: [2,2]})
    @name = "Lizard Frog"
  end
  def loot
    range = [2, 5]
  end
end
